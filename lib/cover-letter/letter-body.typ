#import "../theme.typ"
#import "../i18n.typ": format-date

// Right column of the cover letter: date, subject, text and signature.

// Blank lines in the JSON text separate paragraphs.
#let paragraphs(text) = text.split("\n\n").map(str.trim).join(parbreak())

// Left-aligned, so a wrapped subject is not stretched by justification.
#let subject(title) = block({
  set par(justify: false)
  text(size: theme.sizes.subject, weight: "bold", title)
})

#let letter-body(me, job, s) = [
  // text.lang is set by the template, so the date follows the document language.
  #align(right, context format-date(datetime.today(), text.lang))
  #v(0.4cm)

  #subject((s.subject)(job.job_title, job.company))

  #job.salutation

  #paragraphs(job.content)

  #v(0.4cm)
  #s.closing
  #v(0.8cm)
  #me.name
]
