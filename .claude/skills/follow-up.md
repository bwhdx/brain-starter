---
name: follow-up
description: Quiet CRM — scans your People notes for relationships that have gone quiet or have an open follow-up, and nudges you to reach out, with context on what to say.
---

# /follow-up — keep relationships from decaying

Surface who's worth reaching out to and *why now*, with enough context to make it easy. **Read-only.** Use today's date.

## Read

- `60 People/**` — each person's `relationship`, `last_contact`, `follow_up`, `cadence`, and their note body (open threads, what they care about, last substantive exchange).

## Produce (tight)

Soonest-first:
1. **Open follow-ups due** — anyone whose `follow_up` date has arrived/passed, or who has an explicit open thread.
2. **Gone quiet** — anyone whose `last_contact` is old relative to their cadence. Use the explicit `cadence` field if set (`weekly`/`monthly`/`quarterly`); otherwise judge by relationship (close family/friends sooner; network looser). Don't nag about people just seen.
3. For each: name, why now (the open thread or how long it's been), and a one-line *opener* they could send.

Keep it to 1–3 names that actually matter this week, not the whole address book.

## If there's no data yet

If People notes don't track `last_contact`/`follow_up` yet, say so plainly and offer to start logging contact dates — don't invent contact history.

## Rules

- **Read-only.** Nudge, don't record. Warm, low-pressure — a prompt to reconnect, not a guilt-trip. No invented relationships or dates.
