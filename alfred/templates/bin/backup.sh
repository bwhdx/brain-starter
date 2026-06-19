#!/bin/bash
# Backs up the OpenClaw config/secrets/identity to a local, owner-only tarball.
# Excludes regenerable bulk (logs, sessions, caches, .git). Keeps the most recent
# KEEP. Local-only — include ~/.openclaw-backups in your Time Machine / cloud
# backup for off-disk durability. Secrets are easy to recreate, so losing this is
# a minor inconvenience, not a crisis.
set -euo pipefail

SRC="$HOME/.openclaw"
DEST="$HOME/.openclaw-backups"
KEEP=14
TS="$(date +%Y%m%d-%H%M%S)"
OUT="$DEST/openclaw-$TS.tar.gz"

mkdir -p "$DEST"; chmod 700 "$DEST"

tar --exclude='logs' \
    --exclude='tmp' \
    --exclude='workspace/.git' \
    --exclude='agents/main/sessions' \
    --exclude='workspace-attestations' \
    --exclude='plugin-skills' \
    --exclude='openclaw.json.bak*' \
    --exclude='_bak-*' \
    -czf "$OUT" -C "$HOME" .openclaw

chmod 600 "$OUT"

# Prune old backups, keep newest $KEEP
ls -1t "$DEST"/openclaw-*.tar.gz 2>/dev/null | tail -n +$((KEEP+1)) | while read -r old; do
  rm -f "$old"
done

echo "$(date '+%Y-%m-%d %H:%M:%S') backup ok -> $OUT ($(du -h "$OUT" | cut -f1))"
