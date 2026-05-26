# .claude/ — Claude working dir for the Brain vault

This directory holds Claude-specific configuration and working state. The vault root has the main onboarding doc at `../CLAUDE.md` — read that first.

## Contents

```
.claude/
├── README.md       This file
├── skills/         Personal skills — repeatable workflows
│                   /setup, /capture, /atomize, /weekly-review, /draft, /grade
├── scratch/        Claude's working notes for in-progress tasks
│                   Gitignored. Survives between sessions, not committed.
└── plans/          Larger planning artifacts before multi-session work
```

## How to use

From any terminal:

```bash
cd ~/Brain && claude
```

Claude reads `CLAUDE.md` automatically and learns the vault conventions.

## First run

If the vault is still mostly placeholders (you see `[PLACEHOLDER]` markers in `Now.md`, `Who I am.md`, etc.), run:

```
/setup
```

The setup wizard walks you through ~30-45 min of questions and populates the vault from your answers.

## Skills

| Skill | What it does |
|-------|-------------|
| `/setup` | Interactive wizard to populate a fresh vault |
| `/capture` | Quick inbox drop with auto-frontmatter |
| `/atomize` | Process an inbox item into one or more atoms |
| `/weekly-review` | Walk the Sunday ritual interactively |
| `/draft` | Content drafting from atom → seed → draft → gate → ready (optional content module) |
| `/grade` | Audit a draft against the 11-dimension brand rubric (optional content module) |

## Build your own skills

When you find yourself doing the same workflow 3+ times, codify it as a skill in `skills/{name}.md`. The format is markdown with YAML frontmatter (`name`, `description`) and a body of instructions to Claude.

Examples worth building over time:
- `/atoms-on TOPIC` — pull all atoms tagged with TOPIC as a curated list
- `/before-call TOPIC` — surface values + decisions + atoms relevant to a hard conversation
- `/audit` — run quarterly housekeeping (revisit decisions, stale seedlings, dangling links)

See the existing skills as templates.
