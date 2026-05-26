# 70 Projects — defined-outcome work (optional module)

Anything with a clear start, end, and outcome metric. If it's open-ended and ongoing, it's an Area (`80 Areas/`), not a Project.

> **Optional module.** If you don't want project tracking in your brain, delete this folder.

## Structure

One folder per project. Inside, a `README.md` from the Project template + sub-notes as needed.

```
70 Projects/
├── Q3 product launch/
│   ├── README.md           ← project frontmatter + README
│   ├── Decisions made.md   ← project-scoped notes
│   └── Retro.md
└── Trip to Patagonia/
    └── README.md
```

## Lifecycle

`planning → active → paused → done | killed`

When `done` or `killed`: move the whole folder to `99 Archive/Projects/`.

## Frontmatter

```yaml
---
id: project-{slug}
type: project
name: "Project name"
status: planning | active | paused | done | killed
started: 2026-05-26
target_end:
ended:
outcome_metric: "How you'll know it's done"
tags: []
---
```

## See `_Meta/Templates/Project.md`.
