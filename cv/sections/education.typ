#import "../template.typ": cv-section, cv-event, c-accent

#let education = [
  #cv-section("Education")

  #cv-event(
    "MSc Electronics & Telecommunications",
    "University of Aveiro",
    "2014 – 2020",
    "Aveiro, Portugal",
  )
  #text(weight: "semibold")[Thesis:] Recovery and Identification of Moments
  #h(0.4em)
  #text(fill: c-accent, weight: "bold")[19/20]
  #v(0.15em)
  - Developed a *Python* image retrieval system associating images to moments described in natural-language text.
]
