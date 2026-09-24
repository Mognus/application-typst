// Single entries of the CV sections.

// Job or training: company and period on one line, role below, highlights as bullets.
#let experience(e) = block[
  #strong(e.company) #h(1fr) #emph(e.period) \
  #e.role
  #list(..e.highlights)
]

// School: period, name and an optional detail line.
#let education(e) = block[
  #strong(e.period) \
  #e.school
  #if "detail" in e [ \ #emph(e.detail)]
]
