---
type: meta
created:
---

# Durability — backup strategy

Your brain is a 30-year artifact. Backup must survive: laptop death, account hack, Obsidian Sync outage, Obsidian going out of business, you losing your phone, your house burning down.

## Three independent backups

| Tier | What | Why |
|------|------|-----|
| **1. Obsidian Sync** | Cross-device, real-time | Primary working copy across devices |
| **2. Git → private GitHub** | Hourly auto-commit + push (Obsidian Git plugin) | Offsite version control. Survives Sync failure. Full history. |
| **3. Time Machine** (Mac) or equivalent | Laptop point-in-time | Survives accidental delete that propagates through Sync |

**Two of the three are off-machine.** That's the rule.

## Plus: monthly export ritual

Once a month, zip the vault and drop in iCloud Drive (or another cloud). Once a year, test it: open the zip from a fresh machine, confirm everything's readable.

## When you set up the GitHub repo

```bash
cd ~/Brain
git init -b main
gh repo create brain --private --source=. --remote=origin --description "Personal second brain" --push
```

Then in Obsidian: Settings → Community plugins → Obsidian Git:
- Vault backup interval: 60 (minutes)
- Auto pull interval: 60 (minutes)
- Commit author name + email (use your GitHub identity)

That's it. Hourly commits and pushes, automatic.

## Test your backups

- **Quarterly:** verify GitHub repo has recent commits
- **Annually:** open the monthly export zip on a fresh machine. Confirm it works.

If you can't reconstruct the vault from any one backup independently, you don't have three backups — you have a chain.

## What's intentionally NOT in version control

See `.gitignore`:
- `.obsidian/workspace*` — per-machine UI state (would constantly conflict between devices)
- `.trash/` — local soft-delete bin
- `.claude/scratch/` — working notes, not durable thinking
- macOS `.DS_Store` and editor swap files

Everything else is committed.

## What to do if Obsidian dies

The vault is plain markdown + YAML. Open it in any editor. The graph and Bases views die with Obsidian; the content survives.

Replacement editors (in order of likely fit):
- Logseq (closest match, also Markdown + frontmatter)
- VS Code with Foam extension
- Any plain text editor + grep

The substrate is portable. The tooling is replaceable.
