# Wiring an Alfred to your brain

This brain vault is useful on its own (open it in Claude Code, run the `.claude/skills/`). **Alfred** is the optional next layer: an always-on assistant that runs those skills on a schedule and reaches you on your phone, reading and writing this vault.

It's built on [OpenClaw](https://github.com/openclaw/openclaw) (the engine — channels, cron, skills) driving cognition through the **Claude CLI** on your existing Claude subscription. This folder gives you the persona, the security model, and a setup script; OpenClaw itself is the open base you install separately.

## The one thing to understand first: the security boundary

OpenClaw's own tool policy and Docker sandbox do **not** wrap the Claude CLI cognition — `claude` runs on the host. So the real boundary is **Claude's own permission model**, configured by a *scoped settings file*. Without it, the assistant would inherit whatever's in your personal `~/.claude/settings.json` (often `git push`, `rm`, `curl`, cloud creds — everything you've allowed yourself while coding).

The fix, which `setup.sh` installs: a dedicated `~/.openclaw/claude-config/settings.json` that **allows** only vault read/write + `gog` + web, and **denies** the dangerous commands. The backend loads it with `--setting-sources project --settings <that file>`, which excludes your personal config. Claude's command classifier default-denies other side-effecting commands (python, osascript, etc.) on top.

## Steps

1. **Install prerequisites.** Node 22+ (nvm), `npm i -g openclaw`, Claude Code (logged into your subscription), and optionally [`gog`](https://github.com/) for Google Calendar/Gmail.
2. **Bring up the engine (open-core base).** Run OpenClaw's own onboarding to install the loopback gateway as a launchd daemon:
   ```
   openclaw onboard --install-daemon
   ```
   This is the open-source foundation; everything below layers on top of it. Confirm it's up with `openclaw gateway status`.
3. **Run `./alfred/setup.sh`** from the vault root. It checks prereqs + the daemon, installs the scoped settings (with your paths), drops in the persona templates, and installs the **backup + watchdog** launchd agents (self-healing + daily backup) automatically.
4. **Make the assistant yours.** Edit `~/.openclaw/workspace/USER.md` (who you are) and `SOUL.md` (its character). This is what turns a generic bot into *your* assistant — worth the ten minutes.
5. **Secrets.** Create a Telegram bot via @BotFather, save the token to `~/.openclaw/secrets/telegram.token`. Run `gog auth login` for Google (request **gmail.readonly** — never full Gmail). Set `gog config set gmail_no_send true` as a second layer.
6. **Configure `~/.openclaw/openclaw.json`:** loopback bind, the Claude CLI backend with the scoped-settings args (printed by `setup.sh`), your Telegram allowlist (your id only), and `skills.load.extraDirs` pointing at this vault's `.claude/skills/`.
7. `openclaw gateway restart`, message your bot, and schedule the skills you want as cron jobs (e.g. `triage` silently before a morning `plan-day`, a weekly `commitments` sweep, a `research-digest`).

**Durability note:** keep `~/.openclaw` (it holds secrets) **out of git**. `setup.sh` installs a daily backup to `~/.openclaw-backups/` — add that folder to Time Machine / iCloud for off-disk safety. To get Telegram alerts when the gateway dies, set `NOTIFY_TELEGRAM=1` + `TG_CHAT` in `~/.openclaw/bin/watchdog.sh`.

## What you get

The vault skills now run from your phone and on a schedule — a proactive assistant grounded in your own corpus, not a generic chatbot. The spine is **`/triage`** (the upstream engine that trawls the whole brain, ranks priorities, and writes your day's Top-6) feeding **`/plan-day`** (the morning brief) and **`/wind-down`** (the evening close); plus `/think`, `/commitments`, `/follow-up`, `/scan-deadlines`, `/research`+`/research-digest`, `/resurface`, and the capture/draft/grade loop. **Read `_Meta/Assistant — system design.md` for how they interconnect** (upstream → state → downstream). Treat email and web content as untrusted data; keep anything that sends or posts behind a confirmation.
