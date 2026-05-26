# brain-starter

A working personal second brain you can fork and make your own. Markdown + YAML, Obsidian-compatible, Karpathy-flavoured external cognition. Comes with a setup wizard that walks you through populating it in ~30 minutes via Claude Code.

> **What this is:** a battle-tested vault structure for capture, distillation, retrieval, content creation, decision journalling, and quiet relationship tracking — designed to compound over decades without methodology thrash.
>
> **What this isn't:** a Notion template, a productivity app, or an AI chatbot. It's plain markdown files in folders. Anything you write here outlives any tool.

## Why it exists

Most personal knowledge management systems die within three months. They die for predictable reasons: capture is too high-friction, processing becomes a chore, the structure was over-engineered before you knew what you needed, or the plugin you depended on broke.

This template fixes the predictable failures up front:

- **Capture is one keystroke.** Daily notes + inbox + (optional) voice-note pipeline.
- **Processing is a 15-minute Sunday ritual** with a template and a `/weekly-review` skill that walks you through it.
- **Structure is committed for ≥12 months.** Ten numbered folders, atomic notes, MOCs for navigation, state in frontmatter. The architecture is finished; only the content evolves.
- **Plugin discipline.** Bases (Obsidian core) is preferred over Dataview wherever it covers the need. Cap ~10 community plugins. Everything else is plain markdown.
- **Designed to survive plugin death, Obsidian death, your-laptop death.** Triple-backup: Obsidian Sync + Git + Time Machine.

## What you get

### Structure
- 10 numbered top-level folders + `_Meta` infrastructure + `_Wiki` (deferred Karpathy LLM-wiki scaffold)
- 18 Templater templates covering every note type
- Documented Bases view patterns (you build the actual `.base` files in Obsidian — they vary by Obsidian version, so the template documents the queries to build rather than shipping versioned files)
- Generic schema spec, workflow doc, plugin list, durability plan

### Disciplines you can opt into
- **Capture & learning** (everyone) — daily notes, inbox, atoms, sources, theme maps
- **Content creation** (opt-in) — voice formula, pre-publish gate, vocabulary, pillars, channels, content process, cadence
- **People** (opt-in) — quiet CRM for relationships that matter
- **Decisions** (opt-in) — Annie Duke-style decision journal with retrospectives
- **Projects** (opt-in) — defined-outcome work tracking

### Claude integration
- `CLAUDE.md` at vault root onboards any Claude Code session to the schema, conventions, and your voice
- `.claude/skills/setup.md` — interactive wizard that populates the vault from your answers
- Skills for `/capture`, `/atomize`, `/weekly-review`, `/draft` (content), `/grade` (content)

## Quick start

```bash
git clone https://github.com/<you>/brain-starter ~/Brain
cd ~/Brain
claude
```

Then in Claude:

```
/setup
```

That runs the setup wizard. ~30-45 minutes of questions, and you'll have:

- Your `Now.md` dashboard populated
- Your first 9 atoms (3 beliefs, 3 moments, 3 concepts)
- Your `Who I am` integrating narrative
- Your `Why`, `Mission`, `Values` files
- Optionally: your voice formula, brand bible, pillars (if you do content)
- Optionally: 5-10 people stubs, first project, first decision (if those modules matter to you)
- A weekly-review template and reminder
- A private GitHub repo (if you want one) for offsite backup

After the wizard, see `SETUP.md` for next steps (Obsidian config, plugin installs, sync setup).

## Use cases

- **Operators and founders** — content for LinkedIn/X without the LinkedIn-ghostwriter cadence
- **Researchers and learners** — read with intent, distill what you learned, find it again years later
- **Decision-heavy roles** — decision journals you'll actually re-read because they're queryable
- **Anyone tired of Notion drift** — local-first, markdown, survives any tool

## Philosophy

This template is opinionated about three things and minimal about everything else.

**Opinionated:**

1. **Atomic notes + MOCs for navigation.** One idea per note, dense linking, hand-curated maps. Folgezettel-lite without the IDs.
2. **State in frontmatter, not folder location.** Reading status, draft status, project status all live in YAML. Bases views render the boards. Files don't move around as state changes.
3. **Anti-AI cadence rules for any content you ship.** The setup wizard offers to install these. Most LLM-generated content is detectable in two sentences; the rules cap em dashes, mirror inversions, tricolons, colon-reveals, and journalistic clichés.

**Minimal everywhere else.** Folder structure is flat. Plugin list is short. Templates are templates, not philosophy. Make it yours.

## Acknowledgements

This template is the open-source extraction of one person's working second brain — built over weeks of refinement with Claude Code as a thinking partner. Patterns drawn from:

- Andy Matuschak (evergreen notes, atomic granularity)
- Tiago Forte (PARA, capture habits)
- Nick Milo (LYT / ACE structure)
- Andrej Karpathy (the LLM-wiki idea file pattern, deferred here as `_Wiki/`)
- Annie Duke (decision journalling)
- Heath brothers (the SUCCESs framework for content)

## License

MIT. Fork freely. Make it yours.
