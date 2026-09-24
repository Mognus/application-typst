#import "../theme.typ"

// Label/value table with phone, email, address and links.
#let contact(me, s) = grid(
  columns: 2,
  column-gutter: 0.6em,
  row-gutter: 0.25cm,
  s.phone, me.phone,
  s.email, text(size: theme.sizes.footer, me.email),
  s.address, me.address,
  "GitHub", link("https://" + me.github, me.github),
  "Web", link("https://" + me.web, me.web),
)
