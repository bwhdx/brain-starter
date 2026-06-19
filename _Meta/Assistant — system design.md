---
type: meta
tags: [assistant, architecture, system-design, scheduled-tasks]
---

# Assistant — system design

How the skills fit together as a *system* rather than a pile of islands — so scheduled tasks deliver intelligence instead of reading a list back to you. Read this alongside `alfred/SETUP-ALFRED.md` (how to wire the scheduled assistant) and the `.claude/skills/`.

## The core principle: trawl → update → surface

The flaw to design out: a scheduled task that **reads a list and reads it back** is regurgitation. Your vault holds far more than a to-do list — goals, deadlines, follow-ups, decisions, content inventory, daily-note signals — and most of it sits idle.

The fix is a three-stage flow with a clear upstream/downstream split:

```
   UPSTREAM (compute)            STATE (canonical)          DOWNSTREAM (surface)
   trawl the whole brain    →    To-do "Now"           →    plan-day → brief
   recompute priorities          Today's 6                  wind-down → review
   write the result to state     goal last_reviewed         follow-up / research
```

- **Upstream** *computes and writes* — it trawls, ranks, and updates the canonical state. This is where the brain actually gets leveraged.
- **State** is the thin, machine-written layer everything else reads — the single source of "what matters now."
- **Downstream** *reads and surfaces* — the briefs present the freshly-computed state + the **delta** (what changed), not a re-read of a static file.

## The hub: the triage engine

`/triage` is the upstream hub and the thing that makes this a system. On a schedule it trawls every date-driven input (deadlines, project end-dates, follow-ups due, decision revisits, goal targets, content cadence) *and* signal-driven ones (empty daily notes, stalled goals, unprocessed captures), ranks them, **writes** the top items into the daily note's `## Today's 6` and appends new commitments to the backlog — then `/plan-day` presents it. Run `triage` silently *before* the morning brief so the brief always surfaces fresh intelligence with one notification, not two.

## Inflow is the binding constraint

The trawl is only as good as what flows in. A beautiful structure with empty daily notes, no captured tasks, and no distilled atoms gives the engine nothing to rank. So fixing **inflow** is prerequisite, not optional:

- `/capture` must reliably populate the backlog.
- Daily notes must get filled — `/plan-day` writes the Top-6; `/wind-down` writes what you did / what to process.
- A distill habit turns read books into atoms (which then feed research and content).
- A `last_reviewed` field on goals lets the engine tell a stalled goal from a healthy rolling one.

## Pipelines — how skills chain

1. **Capture → Knowledge:** `capture` → `00 Inbox` → `atomize`/`distill` → `20 Atoms` → fuels `ask`/`think`/`resurface`/`draft`
2. **Content:** atoms + seeds → `draft` → `grade` → published
3. **Relationships:** log a contact → `60 People` (resets `last_contact`/`follow_up`) → `follow-up` surfaces who's due
4. **Compliance:** email/records → `scan-deadlines` → escalate → calendar
5. **Decision:** `decide` → `90 Decisions` (`revisit`) → `triage`/`commitments` resurface on the revisit date
6. **Priority spine:** `triage` trawls everything → writes `Now` + `Today's 6` → `plan-day` surfaces → **you act** → `wind-down` logs the day → feeds the next `triage`

## Interconnectivity — the shared state graph

A handful of **canonical state nodes** are where skills hand off. Whoever *writes* a node, others *read*:

| State node | Written by | Read by |
|---|---|---|
| **To-do "Now"** | `capture`, `triage` | `plan-day`, `commitments` |
| **Daily note** (Top-6 / did / to-process) | `triage`, `plan-day`, `wind-down` | `triage`, `resurface`, `follow-up` |
| **60 People** (`last_contact`/`follow_up`) | (log skills) | `follow-up`, `plan-day`, `commitments` |
| **20 Atoms** | `atomize`, `distill` | `ask`, `think`, `resurface`, `draft`, `research-digest` |
| **90 Decisions** (`revisit`) | `decide` | `triage`, `commitments` |
| **Research radar** | (you) | `research-digest` |

Change one node and the readers react: log a contact and `follow-up` stops nagging; distill a book and `research-digest`/`draft` get sharper; fill a daily note and `triage` can score progress.

## A weekly schedule (example)

```
Daily  06:45  triage (silent)     trawl → rank → write Now/Today's-6
Daily  07:00  plan-day            present the day + delta
Daily  ~20:00 wind-down           reflect + log the day back to state
Weekly       commitments, scan-deadlines, follow-up, research-digest, plan-week, resurface
```

Adapt the cadence to your life. The one rule: the upstream trawl runs *before* the downstream brief.
