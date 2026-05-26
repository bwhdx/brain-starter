---
name: capture
description: Quick drop a thought, link, or snippet into the inbox with auto-frontmatter. Use for anything not tied to today that you want to keep but not process right now.
---

# /capture — quick inbox drop

Frictionless capture. Drop a thought, link, screenshot reference, or half-formed idea into `00 Inbox/` with proper frontmatter. **Don't process while capturing — that's the weekly ritual's job.**

## What to ask

"What's the capture? You can paste a link, a thought, a quote, anything. One line or many."

## What to do

1. Read the user's content
2. Generate a slug from the first few meaningful words (lowercase, hyphenated)
3. Write to `00 Inbox/{YYYYMMDD-HHMM}-{slug}.md`
4. Frontmatter:
   ```yaml
   ---
   type: capture
   created: {today}
   source: chat | voice | web | thought  # infer from context
   processed: false
   ---
   ```
5. Body: the raw content, untouched. Don't summarize. Don't tag. Don't link.

## What NOT to do

- ❌ Don't try to process the capture (extract atoms, link related notes, suggest themes). That's Sunday's job; this skill is capture-only.
- ❌ Don't ask follow-up questions about meaning, intent, or connections. Capture is fast.
- ❌ Don't write a long file. Brevity is the point.

## Confirm and close

After writing, confirm in one line: *"Captured: `00 Inbox/{filename}`. Process on Sunday."*

That's it. Skill ends.
