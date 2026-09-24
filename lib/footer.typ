#import "theme.typ"

#let source = "github.com/Mognus/application-typst"

// Page footer: thin rule, name on the left, link to this project on the right.
#let footer(me) = {
  set text(size: theme.sizes.footer)

  stack(
    spacing: 0.15cm,
    line(length: 100%, stroke: theme.strokes.thin),
    grid(
      columns: (1fr, auto),
      me.name,
      [Made with Typst #link("https://" + source, source)],
    ),
  )
}
