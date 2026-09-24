#import "../theme.typ"

#let bar-width = 2.8cm

// Level bar from 0 to 10.
#let level-bar(level) = {
  assert(level >= 0 and level <= 10, message: "level must be between 0 and 10, got " + str(level))
  box(width: bar-width, height: 0.5em, fill: theme.colors.bar-empty,
    box(width: level * 10%, height: 100%, fill: theme.colors.bar-fill))
}

// One skill: name and level bar on one line, optional keywords below.
#let ability(a) = {
  let keywords = a.at("keywords", default: ())
  let rows = (
    grid(
      columns: (1fr, bar-width),
      column-gutter: 0.2cm,
      strong(a.name),
      level-bar(a.level),
    ),
  )
  if keywords.len() > 0 {
    rows.push(text(size: theme.sizes.keywords, fill: theme.colors.keywords, keywords.join(" · ")))
  }
  stack(spacing: 0.15cm, ..rows)
}
