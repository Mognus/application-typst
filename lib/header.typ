#import "theme.typ"

// Top of the CV: name and job title next to the photo, document title, rule.
#let header(me, document-title) = stack(
  grid(
    columns: (1fr, 15%),
    stack(
      text(size: theme.sizes.headline, weight: "bold", me.name),
      0.35cm,
      text(size: theme.sizes.header-title, me.title),
    ),
    image(me.photo, width: 100%),
  ),
  0.3cm,
  text(size: theme.sizes.document-title, weight: "bold", document-title),
  0.15cm,
  line(length: 100%, stroke: theme.strokes.medium),
)
