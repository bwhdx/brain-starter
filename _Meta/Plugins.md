---
type: meta
created:
---

# Plugins — installed list and rationale

The brain caps community plugins at ~10. Every plugin is a future break point. Bases (core) is preferred over Dataview wherever it covers the need.

## Day-one essentials (4)

| Plugin | Why |
|--------|-----|
| **Templater** | JS-powered templates. Day-one foundation for consistent frontmatter on every new note. |
| **QuickAdd** | Hotkeyed capture menus. The "drop a thought into Inbox without leaving my current app" plugin. |
| **Linter** | Auto-enforces frontmatter schema. Prevents silent drift. |
| **Obsidian Git** | Versioned offsite backup to private GitHub. Hourly auto-commit + push. Belt-and-braces backup. |

## Core plugins (verify enabled)

Settings → Core plugins:
- Daily Notes
- Templates
- Properties (frontmatter editing)
- Bases
- Bookmarks
- Sync (paid, optional)
- Graph, Backlink, Outgoing Link, File Explorer, Search

## Month 2+ — when justified

| Plugin | When |
|--------|------|
| **Smart Connections** | Local-embedding semantic surface. Useful once vault has 100+ notes. |
| **Dataview** | Fallback for what Bases can't do (calendar views, complex aggregations). Most people don't need this. |
| **dsebastien/obsidian-typefully** | Only if posting cadence justifies the friction. |

## Skip unless explicitly needed

Most community plugins. Cap ~10 total. **Adding a new plugin should mean retiring an old one.**

## Why the cap

1. Each plugin is a dependency that can break with Obsidian updates
2. Each plugin is a learning curve for anyone reading your vault
3. Each plugin tempts you to make state plugin-specific instead of frontmatter-portable
4. The vault should outlive every plugin you currently use

## Anti-patterns

- ❌ Installing a plugin because someone on r/ObsidianMD recommended it
- ❌ Using a plugin for what frontmatter + Bases already does
- ❌ Plugins that put state inside note bodies (e.g., Kanban — use a Bases board view instead)
- ❌ "Just trying out" plugins — every install becomes load-bearing within weeks
