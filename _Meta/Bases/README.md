# _Meta/Bases — saved view definitions

Obsidian Bases (core, GA in 1.9.10+) lets you build database-style views over your frontmatter. This folder is where the views live.

> **Note:** the brain-starter ships **without** pre-built `.base` files because Obsidian's Bases YAML format is still iterating and versioned `.base` files from a different Obsidian version can render broken. Instead, this README documents the views you should build (takes ~10 minutes in Obsidian once the vault has some content).

## How to build a Bases view

1. In Obsidian, right-click any folder → New → Base
2. Drag fields from the frontmatter into the columns
3. Add filters (e.g., `type = "draft" AND status = "ready"`)
4. Save into `_Meta/Bases/{descriptive name}.base`

## Recommended starting views

Build these in order — they're the ones the workflow docs reference.

### Reading

| View | Filter | Sort | Columns |
|------|--------|------|---------|
| **Reading — Currently** | `type=source AND kind=book AND status=reading` | `date_started` desc | title, authors, date_started |
| **Reading — To-read queue** | `type=source AND kind=book AND status=to-read` | `date_added` desc | title, authors, date_added |
| **Reading — Read** (year filter optional) | `type=source AND kind=book AND status=read` | `date_read` desc | title, authors, rating, date_read |
| **Reading — All books** | `type=source AND kind=book` | `date_added` desc | title, authors, status, rating |

### Content (only if content module enabled)

| View | Filter | Sort | Columns |
|------|--------|------|---------|
| **Content — Bank seeds** | `type=seed AND status IN (raw, shaped)` | grouped by `pillar` | title, pillar, format, status |
| **Content — Drafts** | `type=draft AND status=draft` | `created` desc | title, channel, voice |
| **Content — Ready to ship** | `type=draft AND status=ready` | `created` desc | title, channel, grade |
| **Content — Published** | `type=published` | `posted_at` desc, grouped by `pillar` | title, channel, posted_at, engagement_notes |

### People (only if people module enabled)

| View | Filter | Sort | Columns |
|------|--------|------|---------|
| **People — Follow-ups due** | `type=person AND follow_up <= today` | `follow_up` asc | name, relationship, last_contact, follow_up |
| **People — All by relationship** | `type=person` | grouped by `relationship` | name, last_contact, follow_up |

### Projects (only if projects module enabled)

| View | Filter | Sort | Columns |
|------|--------|------|---------|
| **Projects — Active** | `type=project AND status=active` | `started` asc | name, started, target_end, outcome_metric |
| **Projects — All** | `type=project` | grouped by `status` | name, status, started, ended |

### Decisions (only if decisions module enabled)

| View | Filter | Sort | Columns |
|------|--------|------|---------|
| **Decisions — Revisit** | `type=decision AND revisit <= today AND status=made` | `revisit` asc | title, date, chose, confidence, revisit |
| **Decisions — Open** | `type=decision AND status=open` | `date` desc | title, date, chose, alternatives |

### Atoms — used in the weekly review

| View | Filter | Sort | Columns |
|------|--------|------|---------|
| **Atoms — Recent seedlings** | `type=atom AND status=seedling AND created >= 30 days ago` | `created` desc | title, kind, themes, related |
| **Atoms — Stale seedlings** | `type=atom AND status=seedling AND created < 90 days ago` | `created` asc | title, kind, themes |
| **Atoms — All by theme** | `type=atom` | grouped by `themes` | title, kind, status |

## Why no pre-built `.base` files?

Two reasons:
1. **Obsidian Bases format is iterating.** A `.base` file built on Obsidian 1.9.10 may render broken on 1.9.12. Better to document the query intent than ship versioned config.
2. **Personal Bases customisations.** Once you've used the vault for a few weeks, your view preferences will drift from any default. Building them yourself takes 10 minutes and you learn the system.

If a future template version finds a stable Bases version to ship against, pre-built `.base` files may land. For now: build them once, commit them to your own private repo, refine over time.
