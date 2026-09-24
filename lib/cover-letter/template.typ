#import "../theme.typ"
#import "../i18n.typ": pick
#import "../footer.typ": footer
#import "i18n.typ": strings
#import "sidebar.typ": sidebar
#import "letter-body.typ": letter-body

// Cover letter page: sidebar on the left, letter on the right.
//   me:  personal data (personal-data.json)
//   job: company data (companies/<name>.json)
#let cover-letter(me, job, lang: "de") = {
  let s = pick(strings, lang)

  set document(title: (s.subject)(job.job_title, job.company), author: me.name)
  set page(paper: "a4", margin: (x: 1.5cm, y: 2cm), footer: footer(me))
  set text(font: theme.font, size: theme.sizes.letter, lang: lang)
  set par(justify: true, spacing: 0.4cm)
  show link: set text(fill: theme.colors.link)

  grid(
    columns: (28%, 1fr),
    column-gutter: 7%,
    sidebar(me, s),
    letter-body(me, job, s),
  )
}
