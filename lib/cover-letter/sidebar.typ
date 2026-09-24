#import "../theme.typ"
#import "../section-heading.typ": section-heading

// Left column of the cover letter: name, job title and contact details.
#let sidebar(me, s) = {
  set par(justify: false)

  stack(
    text(size: theme.sizes.name, weight: "bold", me.name),
    0.3cm,
    me.title,
    0.5cm,
    section-heading(s.contact),
    0.25cm,
    text(size: theme.sizes.small, stack(
      spacing: 0.3cm,
      me.address,
      me.phone,
      me.email,
      link("https://" + me.web, me.web),
    )),
  )
}
