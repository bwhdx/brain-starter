#!/bin/bash
# OpenClaw gateway watchdog. launchd KeepAlive already restarts a *crashed*
# daemon; this catches the wedged-but-alive case (process up, not responding),
# self-heals with a restart, and alerts (local macOS notification + optional
# Telegram DM). Runs every few minutes via ai.openclaw.watchdog.plist.
#
# Portable: uses whatever node/openclaw are on PATH (nvm, fnm, brew all work).
set -uo pipefail

NODE_BIN="$(dirname "$(command -v node 2>/dev/null)" 2>/dev/null)"
export PATH="${NODE_BIN:+$NODE_BIN:}$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
OPENCLAW="$(command -v openclaw 2>/dev/null)"
LOG="$HOME/.openclaw/logs/watchdog.log"
mkdir -p "$(dirname "$LOG")"

# --- Telegram alerts: OFF by default. To enable, set NOTIFY_TELEGRAM=1 and your TG_CHAT id. ---
NOTIFY_TELEGRAM=0
TG_CHAT=""                                     # your numeric Telegram chat id
TG_TOKEN_FILE="$HOME/.openclaw/secrets/telegram.token"
DOWN_MARKER="$HOME/.openclaw/tmp/watchdog-down-alerted"   # debounce repeat alerts (1h)

ts() { date '+%Y-%m-%d %H:%M:%S'; }
notify_mac() { osascript -e "display notification \"$1\" with title \"OpenClaw watchdog\"" >/dev/null 2>&1 || true; }
notify_tg() {
  [ "$NOTIFY_TELEGRAM" = "1" ] && [ -n "$TG_CHAT" ] && [ -r "$TG_TOKEN_FILE" ] || return 0
  local token; token="$(tr -d '[:space:]' < "$TG_TOKEN_FILE")"
  [ -n "$token" ] || return 0
  curl -s --max-time 10 "https://api.telegram.org/bot${token}/sendMessage" \
    --data-urlencode "chat_id=${TG_CHAT}" --data-urlencode "text=$1" >/dev/null 2>&1 || true
}

[ -n "$OPENCLAW" ] || { echo "$(ts) openclaw not found on PATH" >> "$LOG"; exit 0; }

status_out="$("$OPENCLAW" gateway status 2>&1)"
if printf '%s' "$status_out" | grep -qiE "running|state active"; then
  rm -f "$DOWN_MARKER" 2>/dev/null || true
  exit 0
fi

echo "$(ts) UNHEALTHY: $(printf '%s' "$status_out" | tr '\n' ' ' | cut -c1-200)" >> "$LOG"
notify_mac "Gateway not responding — attempting restart"
"$OPENCLAW" gateway restart >/dev/null 2>&1
sleep 4
recheck="$("$OPENCLAW" gateway status 2>&1)"
if printf '%s' "$recheck" | grep -qiE "running|state active"; then
  echo "$(ts) RECOVERED after restart" >> "$LOG"
  if [ -f "$DOWN_MARKER" ]; then notify_tg "✅ Gateway was wedged but auto-restarted — back up."; rm -f "$DOWN_MARKER"; fi
else
  echo "$(ts) RESTART FAILED" >> "$LOG"
  notify_mac "Restart FAILED — needs attention"
  mkdir -p "$(dirname "$DOWN_MARKER")"
  if [ ! -f "$DOWN_MARKER" ] || [ "$(find "$DOWN_MARKER" -mmin +60 2>/dev/null)" ]; then
    notify_tg "⚠️ Gateway is DOWN and auto-restart failed. Needs attention when you're back."
    touch "$DOWN_MARKER"
  fi
fi
