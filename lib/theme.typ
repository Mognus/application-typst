// Shared look for all documents. Change fonts, sizes and colors here only.

#let font = "New Computer Modern"

#let sizes = (
  // Base text
  letter: 12pt,           // cover letter
  body: 11pt,             // CV and skills profile
  // Cover letter
  subject: 13.5pt,
  name: 20.7pt,           // name in the sidebar
  // Header (CV and skills profile)
  headline: 24.9pt,       // name
  header-title: 12pt,     // job title under the name
  document-title: 16pt,   // "Lebenslauf" above the header rule
  // Shared
  heading: 12pt,          // section headings
  small: 11pt,
  footer: 10pt,
  keywords: 9pt,          // keywords under a skill
)

#let colors = (
  // Muted blue: reads as a link without shouting.
  link: rgb("#1A4FA0"),
  // Skill level bar and the keywords below it.
  bar-fill: luma(64),
  bar-empty: luma(209),
  keywords: luma(115),
)

#let strokes = (
  thin: 0.4pt,
  medium: 0.6pt,
)
