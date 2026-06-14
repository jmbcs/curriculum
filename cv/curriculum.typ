#import "config.typ": *
#import "template.typ": *
#import "sections/experience.typ": experience
#import "sections/skills.typ": skills
#import "sections/education.typ": education
#import "sections/languages.typ": languages
#import "sections/links.typ": links

// ── Document Setup ─────────────────────────────────────────────────────────────

#set page(
  paper: "a4",
  margin: (x: 1.25cm, y: 1.1cm),
)

#set text(
  font: "Nimbus Sans",
  size: 9pt,
  fill: c-body,
)

#set par(leading: 0.55em, spacing: 0.72em, justify: false)

#set list(
  marker: text(fill: c-accent, size: 8pt)[•],
  indent: 0.9em,
  body-indent: 0.4em,
)

// Accent-colored links (contact + relevant links)
#show link: set text(fill: c-accent)

// ── Header ─────────────────────────────────────────────────────────────────────

#grid(
  columns: (1fr, auto),
  column-gutter: 1.2em,
  align: horizon,

  // Name + tagline + contact
  [
    #text(size: 25pt, weight: "bold", fill: c-ink)[#upper(cv-name)]
    #v(0.2em)
    #text(size: 12pt, fill: c-accent, weight: "semibold")[#cv-tagline]
    #v(0.5em)

    #set text(size: 8.6pt, fill: c-body)
    #grid(
      columns: (auto, auto),
      column-gutter: 1.4em,
      row-gutter: 0.5em,
      [#cv-icon("email") #h(0.35em) #link("mailto:" + cv-email)[#cv-email]],
      [#cv-icon("pin") #h(0.35em) #cv-location],
      [#cv-icon("linkedin") #h(0.35em) #link("https://linkedin.com/in/" + cv-linkedin-handle)[#cv-linkedin-handle]],
      [#cv-icon("github") #h(0.35em) #link("https://github.com/" + cv-github-handle)[#cv-github-handle]],
      grid.cell(colspan: 2)[#cv-icon("globe") #h(0.35em) #link(cv-homepage)[#cv-homepage-label]],
    )
  ],

  // Photo (circular crop)
  box(
    width: 2.7cm,
    height: 2.7cm,
    clip: true,
    radius: 50%,
    image(cv-photo, width: 2.7cm, height: 2.7cm, fit: "cover"),
  ),
)

#v(0.42em)
#line(length: 100%, stroke: 1.3pt + c-accent)
#v(0.42em)

// Summary
#text(size: 9pt, fill: c-body)[#cv-summary]

#v(0.1em)

// ── Body (two-column) ──────────────────────────────────────────────────────────

#grid(
  columns: (1fr, 6cm),
  column-gutter: 1.3em,

  // Left — experience + education
  [
    #experience
    #education
  ],

  // Right — skills + languages + links
  [
    #skills
    #languages
    #links
  ],
)
