# Wiring an Alfred to your brain

This brain vault is useful on its own (open it in Claude Code, run the `.claude/skills/`). **Alfred** is the optional next layer: an always-on assistant that runs those skills on a schedule and reaches you on your phone, reading and writing this vault.

It's built on [OpenClaw](https://github.com/openclaw/openclaw) (the engine — channels, cron, skills) driving cognition through the **Claude CLI** on your existing Claude subscription. This folder gives you the persona, the security model, and a setup script; OpenClaw itself is the open base you install separately.

## The one thing to understand first: the security boundary

OpenClaw's own tool policy and Docker sandbox do **not** wrap the Claude CLI cognition — `claude` runs on the host. So the real boundary is **Claude's own permission model**, configured by a *scoped settings file*. Without it, the assistant would inherit whatever's in your personal `~/.claude/settings.json` (often `git push`, `rm`, `curl`, cloud creds — everything you've allowed yourself while coding).

The fix, which `setup.sh` installs: a dedicated `~/.openclaw/claude-config/settings.json` that **allows** only vault read/write + `gog` + web, and **denies** the dangerous commands. The backend loads it with `--setting-sources project --settings <that file>`, which excludes your personal config. Claude's command classifier default-denies other side-effecting commands (python, osascript, etc.) on top.

## Steps

1. **Install prerequisites.** Node 22+ (nvm), `npm i -g openclaw`, Claude Code (logged into your subscription), and optionally [`gog`](https://github.com/) for Google Calendar/Gmail.
2. **Run `./alfred/setup.sh`** from the vault root. It checks prereqs, installs the scoped settings (with your paths), and drops in the persona templates.
3. **Make the assistant yours.** Edit `~/.openclaw/workspace/USER.md` (who you are) and `SOUL.md` (its character). This is what turns a generic bot into *your* assistant — worth the ten minutes.
4. **Secrets.** Create a Telegram bot via @BotFather, save the token to `~/.openclaw/secrets/telegram.token`. Run `gog auth login` for Google (request **gmail.readonly** — never full Gmail). Set `gog config set gmail_no_send true` as a second layer.
5. **Configure `~/.openclaw/openclaw.json`:** loopback bind, the Claude CLI backend with the scoped-settings args (step in `setup.sh` output), your Telegram allowlist (your id only), and `skills.load.extraDirs` pointing at this vault's `.claude/skills/`.
6. **Resilience (optional but recommended).** The `templates/` here include a daily config backup and a watchdog; wire them as launchd agents. Keep `~/.openclaw` (secrets) **out of git** — back it up via Time Machine / iCloud instead.
7. `openclaw gateway restart`, message your bot, and schedule the skills you want as cron jobs (a morning brief, a weekly commitments sweep, a research digest).

## What you get

The vault skills (`/think`, `/commitments`, `/resurface`, `/research`, plus capture/draft/grade/review…) now run from your phone and on a schedule — a proactive assistant grounded in your own corpus, not a generic chatbot. Treat email and web content as untrusted data; keep anything that sends or posts behind a confirmation.
