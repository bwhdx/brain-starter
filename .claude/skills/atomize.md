---
name: atomize
description: Process an inbox item (or a daily-note entry) into one or more atoms. Use during the weekly review or whenever a capture is ready to graduate.
---

# /atomize — capture → atom(s)

Take a captured inbox item or daily-note entry and turn it into one or more proper atoms in `20 Atoms/`. The discipline: extract the *insight*, link it densely, set the right theme.

## What to ask

"Which inbox item or daily-note entry are we atomising? Give me the path, or paste the content."

If the user pastes content, write it to the relevant inbox path first so the source is preserved.

## What to do

1. **Read the content + surrounding context.** What's the actual idea here? Often what looks like one thought is two or three; sometimes it's a fragment of an existing atom.
2. **Determine the kind.** Concept (mental model), Belief (opinion), Moment (lived event), Quote (someone said), Observation (pattern noticed).
3. **Propose the atom title.** Should be a short sentence stating the idea, not a topic label. *"Consistency beats intensity"* not *"On effort over time"*.
4. **Search for existing related atoms.** Grep `20 Atoms/` for likely themes. Find 3-5 candidates to link.
5. **Propose the theme.** Look at `30 Maps/` for an existing fit; suggest creating a new map if 3+ atoms cluster around a new theme.
6. **Draft the atom file** at `20 Atoms/{Concepts|Beliefs|Moments|Quotes|Observations}/{Title}.md`:
   - Frontmatter from `_Meta/Templates/Atom.md`
   - `status: seedling`
   - `themes: [proposed theme]`
   - `related:` filled in
   - Body: the idea stated clearly in 1-3 paragraphs
7. **Show the user before writing.** Get their nod (or edits).
8. **After writing:** move/delete the inbox item (or note in the daily that it's been graduated).

## If the content is actually multiple atoms

Surface this. *"This looks like two atoms — one about X, one about Y. Should I split?"*

## If the content isn't atom-worthy

Surface this too. *"This looks more like a captured observation that's not yet a refined idea. Want to leave it in inbox for next week, or archive?"*

## Output

After writing the atom(s):

```
ATOMISED

Source: 00 Inbox/{original}
Atom(s):
  - 20 Atoms/Concepts/{title}.md  →  status: seedling
  - 20 Atoms/Beliefs/{title}.md   →  status: seedling

Linked: [[atom1]], [[atom2]], [[atom3]]
Themes: [theme]
Map suggested: [[30 Maps/{theme}.md]] (existing | new)

Inbox item: deleted | moved to archive
```

## When to refuse / push back

- If the content is too vague to atomise — say so. Suggest the user clarify or shelf.
- If the content would create a 5th-redundant atom on the same point — surface it. Suggest refining the existing atom instead.
