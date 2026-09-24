#import "../theme.typ"
#import "../i18n.typ": pick
#import "../header.typ": header
#import "../footer.typ": footer
#import "../section-heading.typ": section-heading
#import "i18n.typ": strings
#import "ability.typ": ability
#import "balance.typ": split-point

// Category heading with its skills below.
#let category(c) = stack(
  spacing: 0.25cm,
  section-heading(c.name, size: theme.sizes.heading),
  ..c.abilities.map(ability),
)

#let skill-column(categories) = stack(spacing: 0.5cm, ..categories.map(category))

// Skills profile page: header on top, categories balanced over two columns.
//   me:   personal data (personal-data.json)
//   data: skills (abilities.json)
#let ability-sheet(me, data, lang: "de") = {
  let s = pick(strings, lang)
  let categories = data.categories
  let mid = split-point(categories)

  set document(title: s.title + " " + me.name, author: me.name)
  set page(paper: "a4", margin: (x: 1.4cm, y: 1.2cm), footer: footer(me))
  set text(font: theme.font, size: theme.sizes.body, lang: lang)
  show link: set text(fill: theme.colors.link)

  header(me, s.title)
  v(0.5cm)

  grid(
    columns: (1fr, 1fr),
    column-gutter: 8%,
    skill-column(categories.slice(0, mid)),
    skill-column(categories.slice(mid)),
  )
}
