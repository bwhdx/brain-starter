#!/bin/bash
# setup.sh — wire an "Alfred" (OpenClaw + Claude CLI) to this brain vault.
#
# What this DOES automatically (safe, idempotent):
#   - checks prerequisites (node, openclaw, claude, gog)
#   - checks the OpenClaw gateway daemon is set up (points you at onboarding if not)
#   - installs the SCOPED Claude permission settings (the security boundary)
#   - installs the assistant persona files into the OpenClaw workspace
#   - installs the resilience scripts (backup + watchdog) and their launchd agents
#
# What it leaves to you (interactive / sensitive — see SETUP-ALFRED.md):
#   - the OpenClaw onboarding itself + the Telegram bot token + Google (gog) auth
#   - the gateway config (openclaw.json) wiring
#
# Re-run any time; it won't clobber a persona file you've already customised.
set -euo pipefail

say() { printf '\n\033[1m%s\033[0m\n' "$1"; }
ok()  { printf '  \033[32m✓\033[0m %s\n' "$1"; }
warn(){ printf '  \033[33m!\033[0m %s\n' "$1"; }

HERE="$(cd "$(dirname "$0")" && pwd)"
VAULT="$(cd "$HERE/.." && pwd)"        # the brain vault is this repo's root
OPENCLAW="$HOME/.openclaw"

say "Alfred setup — vault: $VAULT"

# --- 1. Prerequisites ---
say "1. Checking prerequisites"
command -v node >/dev/null && ok "node $(node -v)" || warn "node not found — install Node 22+ (nvm recommended)"
command -v openclaw >/dev/null && ok "openclaw $(openclaw --version 2>/dev/null | head -1)" || warn "openclaw not found — run: npm i -g openclaw"
command -v claude >/dev/null && ok "claude CLI present" || warn "claude not found — install Claude Code + log in (Claude subscription)"
command -v gog >/dev/null && ok "gog present (Google: calendar/gmail/tasks)" || warn "gog not found — optional, needed for calendar/inbox skills"

# --- 2. Engine: is the OpenClaw gateway daemon set up? ---
say "2. Checking the OpenClaw engine"
if command -v openclaw >/dev/null && openclaw gateway status >/dev/null 2>&1; then
  ok "gateway daemon is set up"
else
  warn "no gateway daemon yet. Bring up the engine FIRST, then re-run this:"
  printf '      openclaw onboard --install-daemon\n'
  printf '    (installs the loopback gateway as a launchd daemon — the open-core base this layers on)\n'
fi

# --- 3. Scoped permission settings (THE security boundary) ---
say "3. Installing scoped Claude permissions"
mkdir -p "$OPENCLAW/claude-config"
sed -e "s|__VAULT__|$VAULT|g" -e "s|__HOME__|$HOME|g" \
    "$HERE/templates/claude-settings.json" > "$OPENCLAW/claude-config/settings.json"
ok "wrote $OPENCLAW/claude-config/settings.json (allow: vault R/W + gog + web; deny: git push, rm, curl, aws, sudo…)"

# --- 4. Persona (the 'soul') ---
say "4. Installing assistant persona"
mkdir -p "$OPENCLAW/workspace"
for f in SOUL.md USER.md IDENTITY.md; do
  if [ -f "$OPENCLAW/workspace/$f" ] && ! grep -q "worked example\|Fill this in\|nameplate" "$OPENCLAW/workspace/$f" 2>/dev/null; then
    warn "$f already customised — left as-is"
  else
    cp "$HERE/templates/workspace/$f" "$OPENCLAW/workspace/$f"
    ok "installed workspace/$f"
  fi
done

# --- 5. Resilience: backup + watchdog ---
say "5. Installing resilience (backup + watchdog)"
mkdir -p "$OPENCLAW/bin"; chmod 700 "$OPENCLAW/bin"
cp "$HERE/templates/bin/backup.sh" "$OPENCLAW/bin/backup.sh"
cp "$HERE/templates/bin/watchdog.sh" "$OPENCLAW/bin/watchdog.sh"
chmod 700 "$OPENCLAW/bin/"*.sh
ok "installed bin/backup.sh + bin/watchdog.sh"
# launchd agents (paths substituted)
for label in watchdog backup; do
  plist="$HOME/Library/LaunchAgents/ai.openclaw.$label.plist"
  sed "s|__HOME__|$HOME|g" "$HERE/templates/launchd/ai.openclaw.$label.plist" > "$plist"
  launchctl bootout "gui/$(id -u)" "$plist" 2>/dev/null || true
  if launchctl bootstrap "gui/$(id -u)" "$plist" 2>/dev/null; then
    ok "loaded ai.openclaw.$label (watchdog every 5 min · backup daily 04:30)"
  else
    warn "wrote $plist — load it with: launchctl bootstrap gui/$(id -u) \"$plist\""
  fi
done
"$OPENCLAW/bin/backup.sh" >/dev/null 2>&1 && ok "initial backup written to ~/.openclaw-backups" || warn "run ~/.openclaw/bin/backup.sh once the daemon is up"

# --- Next steps (you do these — see SETUP-ALFRED.md) ---
say "Done with the automated parts. Remaining (see alfred/SETUP-ALFRED.md):"
cat <<EOF
  a) If you haven't: 'openclaw onboard --install-daemon' to bring up the gateway, then re-run this.
  b) Edit ~/.openclaw/workspace/USER.md and SOUL.md — make the assistant yours.
  c) Create a Telegram bot (@BotFather) → save the token to
     ~/.openclaw/secrets/telegram.token  (chmod 600)
  d) (optional) 'gog auth login' for Google Calendar + Gmail (readonly);
     then 'gog config set gmail_no_send true'.
  e) Configure ~/.openclaw/openclaw.json — point the claude-cli backend at the
     scoped settings by setting its args to include:
         --setting-sources project --settings ~/.openclaw/claude-config/settings.json
     and load skills from this vault:
         skills.load.extraDirs: ["$VAULT/.claude/skills"]
  f) 'openclaw gateway restart' and message your bot.
  g) (optional) enable Telegram watchdog alerts: set NOTIFY_TELEGRAM=1 and TG_CHAT
     in ~/.openclaw/bin/watchdog.sh.

The scoped settings, persona, backup, and watchdog are live now — your assistant is
sandboxed and self-healing before you wire anything else.
EOF
