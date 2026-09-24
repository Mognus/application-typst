#import "theme.typ"

// Uppercase label with a thin rule underneath, e.g. "KONTAKT".
#let section-heading(title, size: theme.sizes.small) = stack(
  spacing: 0.15cm,
  text(size: size, weight: "bold", upper(title)),
  line(length: 100%, stroke: theme.strokes.thin),
)
