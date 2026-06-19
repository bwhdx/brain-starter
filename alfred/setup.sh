#!/bin/bash
# setup.sh — wire an "Alfred" (OpenClaw + Claude CLI) to this brain vault.
#
# What this DOES automatically (safe, idempotent):
#   - checks prerequisites (node, openclaw, claude, gog)
#   - installs the SCOPED Claude permission settings (the security boundary),
#     with your paths filled in
#   - installs the assistant persona files into the OpenClaw workspace
#
# What it leaves to you (interactive / sensitive — see SETUP-ALFRED.md):
#   - creating the Telegram bot token + Google (gog) auth
#   - the OpenClaw gateway config + launchd daemon
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
command -v openclaw >/dev/null && ok "openclaw $(openclaw --version 2>/dev/null | head -1)" || warn "openclaw not found — 'npm i -g openclaw'"
command -v claude >/dev/null && ok "claude CLI present" || warn "claude not found — install Claude Code + log in (Claude subscription)"
command -v gog >/dev/null && ok "gog present (Google: calendar/gmail/tasks)" || warn "gog not found — optional, needed for calendar/inbox skills"

# --- 2. Scoped permission settings (THE security boundary) ---
say "2. Installing scoped Claude permissions"
mkdir -p "$OPENCLAW/claude-config"
sed -e "s|__VAULT__|$VAULT|g" -e "s|__HOME__|$HOME|g" \
    "$HERE/templates/claude-settings.json" > "$OPENCLAW/claude-config/settings.json"
ok "wrote $OPENCLAW/claude-config/settings.json (allow: vault R/W + gog + web; deny: git push, rm, curl, aws, sudo…)"

# --- 3. Persona (the 'soul') ---
say "3. Installing assistant persona"
mkdir -p "$OPENCLAW/workspace"
for f in SOUL.md USER.md IDENTITY.md; do
  if [ -f "$OPENCLAW/workspace/$f" ] && ! grep -q "worked example\|Fill this in\|nameplate" "$OPENCLAW/workspace/$f" 2>/dev/null; then
    warn "$f already customised — left as-is"
  else
    cp "$HERE/templates/workspace/$f" "$OPENCLAW/workspace/$f"
    ok "installed workspace/$f"
  fi
done

# --- 4. Next steps (you do these — see SETUP-ALFRED.md) ---
say "Done with the automated parts. Remaining (see alfred/SETUP-ALFRED.md):"
cat <<EOF
  a) Edit ~/.openclaw/workspace/USER.md and SOUL.md — make the assistant yours.
  b) Create a Telegram bot (@BotFather) → save the token to
     ~/.openclaw/secrets/telegram.token  (chmod 600)
  c) (optional) 'gog auth login' for Google Calendar + Gmail (readonly).
  d) Configure ~/.openclaw/openclaw.json — point the claude-cli backend at the
     scoped settings by setting its args to include:
         --setting-sources project --settings ~/.openclaw/claude-config/settings.json
     and load skills from this vault:
         skills.load.extraDirs: ["$VAULT/.claude/skills"]
  e) 'openclaw gateway restart' and message your bot.

The scoped settings are live now — your assistant is sandboxed to the vault + gog + web
before you wire anything else.
EOF
