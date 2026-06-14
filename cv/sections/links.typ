#import "../template.typ": cv-section, c-body

#let links = [
  #cv-section("Relevant Links")
  #set text(size: 8pt, fill: c-body)

  #text(weight: "bold")[BigHPC] — #link("https://bighpc.wavecom.pt/")[bighpc.wavecom.pt]
  #v(0.32em)
  #text(weight: "bold")[Conference Talk] — #link("https://www.youtube.com/watch?v=5gaiovo9DD0")[youtube.com]
  #v(0.32em)
  #text(weight: "bold")[Thesis] — #link("https://ria.ua.pt/handle/10773/30553")[ria.ua.pt]
  #v(0.32em)
  #text(weight: "bold")[Thesis Paper] — #link("https://ceur-ws.org/Vol-2696/paper_91.pdf")[ceur-ws.org]
]
