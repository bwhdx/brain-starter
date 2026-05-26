# 00 Inbox — quick capture

Drop zone for anything that's worth keeping but not yet processed.

## What goes here

- Half-formed thoughts you don't want to lose
- Links, screenshots, snippets to revisit
- Voice-note transcripts
- Quotes you stumbled on
- Anything that arrives outside the daily-note context

## What happens to it

Processed weekly during the Sunday review. Each item gets:
- Promoted to an atom in `20 Atoms/` (if it's keep-worthy thinking)
- Moved to a source note in `40 Sources/` (if it's external material)
- Moved to a seed in `50 Content/Bank/` (if it's a content idea)
- Moved into a project folder in `70 Projects/` (if it's project-related)
- Or deleted

## Don't

- Don't process while capturing. Capture is fast, processing is deliberate. Different mental modes.
- Don't let items sit for >30 days. If you haven't promoted them in a month, archive or delete.

## File naming

`{YYYYMMDD-HHMM}-{slug}.md` or just descriptive prose. The wizard creates inbox items with the timestamp prefix; manual drops can be either.

## Frontmatter

```yaml
---
type: capture
created: 2026-05-26
source: chat | voice | web | thought
processed: false
---
```
