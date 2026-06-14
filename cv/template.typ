// ── Color Palette ─────────────────────────────────────────────────────────────
// Clean, professional, print/ATS-friendly. Dark navy accent, neutral text.

#let c-ink       = rgb("#1A1A1A")  // name / headings / strong text
#let c-accent    = rgb("#1F3A5F")  // deep professional navy
#let c-body      = rgb("#2B2B2B")  // body copy
#let c-muted     = rgb("#5C5C66")  // secondary text
#let c-subtle    = rgb("#8A8F98")  // tertiary / locations
#let c-divider   = rgb("#D9DCE1")  // hairlines

// ── Inline icon (bundled SVGs in icons/) ───────────────────────────────────────

#let cv-icon(name, size: 9pt) = box(
  baseline: 0.18em,
  image("icons/" + name + ".svg", height: size),
)

// ── Section Header ─────────────────────────────────────────────────────────────

#let cv-section(title) = {
  v(0.5em)
  text(weight: "bold", size: 12.5pt, fill: c-ink)[#title]
  v(0.14em)
  line(length: 100%, stroke: 1pt + c-accent)
  v(0.36em)
}

// ── Experience / Education Entry Header ─────────────────────────────────────────

#let cv-event(role, org, period, loc) = {
  text(size: 11.5pt, fill: c-ink)[#role]
  linebreak()
  text(fill: c-accent, weight: "bold", size: 9.5pt)[#org]
  v(0.26em)
  grid(
    columns: (1fr, auto),
    column-gutter: 0.5em,
    [#cv-icon("calendar", size: 8pt) #h(0.3em) #text(size: 8.4pt, fill: c-muted)[#period]],
    [#cv-icon("pin", size: 8pt) #h(0.3em) #text(size: 8.4pt, fill: c-muted)[#loc]],
  )
  v(0.24em)
}

// ── Thin Horizontal Divider ────────────────────────────────────────────────────

#let cv-divider = line(length: 100%, stroke: 0.4pt + c-divider)

// ── Skill / Tag Chips ───────────────────────────────────────────────────────────

#let chip(body, core: false) = box(
  fill: white,
  stroke: 0.6pt + (if core { c-accent } else { c-divider }),
  inset: (x: 5pt, y: 2.5pt),
  outset: (y: 2.5pt),
  radius: 3pt,
)[#text(
    size: 7.6pt,
    fill: if core { c-accent } else { c-muted },
  )[#body]]

// Skill category: bold label + a wrapping row of chips.
// `items` is an array of strings, or (label, true) pairs for core-stack chips.
#let skill-cat(label, items) = {
  text(weight: "bold", size: 8.5pt, fill: c-ink)[#label]
  v(0.3em)
  set par(leading: 1.0em)
  items.map(it => {
    if type(it) == array { chip(it.at(0), core: it.at(1)) } else { chip(it) }
  }).join([ ])
  v(0.46em)
}
