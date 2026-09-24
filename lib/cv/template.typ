#import "../theme.typ"
#import "../i18n.typ": pick
#import "../footer.typ": footer
#import "../section-heading.typ": section-heading
#import "i18n.typ": strings
#import "../header.typ": header
#import "contact.typ": contact
#import "entries.typ": experience, education

// Heading with its content right below.
#let section(title, body) = stack(
  spacing: 0.3cm,
  section-heading(title, size: theme.sizes.heading),
  body,
)

// CV page: header on top, contact/education/skills left, summary/experience right.
//   me:   personal data (personal-data.json)
//   data: CV content (cv.json)
#let cv(me, data, lang: "de") = {
  let s = pick(strings, lang)

  set document(title: s.title + " " + me.name, author: me.name)
  set page(paper: "a4", margin: 1.5cm, footer: footer(me))
  set text(font: theme.font, size: theme.sizes.body, lang: lang)
  set list(indent: 0.2em, spacing: 0.5em)
  show link: set text(fill: theme.colors.link)

  header(me, s.title)
  v(0.6cm)

  grid(
    columns: (44%, 1fr),
    column-gutter: 4%,
    stack(
      spacing: 0.7cm,
      section(s.contact, contact(me, s)),
      section(s.education, stack(spacing: 0.35cm, ..data.education.map(education))),
      section(s.skills, list(..data.skills)),
      section(s.languages, list(..data.languages)),
    ),
    stack(
      spacing: 0.7cm,
      section(s.summary, list(..data.summary)),
      section(s.experience, stack(spacing: 0.45cm, ..data.experience.map(experience))),
    ),
  )
}
