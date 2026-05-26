# 30 Maps — Maps of Content (MOCs)

Hand-curated navigation by theme. The graph view is the messy version; Maps are the curated version.

## What goes here

One file per theme. A Map gathers atoms, sources, projects — anything relevant — under a single hub. Examples:

- *"Agency and choice"* — collected beliefs about will, autonomy, freedom of action
- *"Compounding and the long arc"* — atoms about consistency, patience, long-term thinking
- *"Leadership under pressure"* — moments + concepts about steadying a team

## When to create one

When you notice **3+ atoms clustering around a theme**, make a Map. Earlier than that and you're guessing; later than that and the cluster is invisible to retrieval.

## What a Map looks like

```markdown
---
id: map-{theme-slug}
type: map
created: 2026-05-26
tags: [theme-name]
---

# Theme name

One-paragraph description: what this theme is, why it matters, what unifies the atoms in it.

## Atoms in this theme (N)

- [[Atom 1]]
- [[Atom 2]]
- [[Atom 3]]
...

## See also

- [[Related map]]
- [[Identity doc that touches this theme]]
```

## How Maps evolve

When a new atom lands with the relevant `themes:` tag, the Bases view picks it up automatically. Add the wikilink to the Map manually if it belongs in the curated reading order.

## See `_Meta/Templates/Map.md` for the template.
