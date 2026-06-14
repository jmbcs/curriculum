#import "../template.typ": cv-section, c-body

#let links = [
  #cv-section("Relevant Links")
  #set text(size: 8.6pt, fill: c-body)

  - #text(weight: "bold")[BigHPC Project]: #link("https://bighpc.wavecom.pt/")
  - #text(weight: "bold")[BigHPC Talk]: #link("https://www.youtube.com/watch?v=5gaiovo9DD0")
  - #text(weight: "bold")[Thesis]: #link("https://ria.ua.pt/handle/10773/30553")
  - #text(weight: "bold")[Thesis Paper]: #link("https://ceur-ws.org/Vol-2696/paper_91.pdf")
]
