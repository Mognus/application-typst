#import "theme.typ"

// Small uppercase label with a thin rule underneath, e.g. "KONTAKT".
#let section-heading(title) = stack(
  spacing: 0.15cm,
  text(size: theme.sizes.small, weight: "bold", upper(title)),
  line(length: 100%, stroke: theme.strokes.thin),
)
