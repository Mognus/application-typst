// Language helpers shared by all documents.

#let months = (
  de: ("Januar", "Februar", "März", "April", "Mai", "Juni",
       "Juli", "August", "September", "Oktober", "November", "Dezember"),
  en: ("January", "February", "March", "April", "May", "June",
       "July", "August", "September", "October", "November", "December"),
)

// Long date, e.g. "23. September 2026" (de) or "September 23, 2026" (en).
#let format-date(d, lang) = {
  let month = months.at(lang).at(d.month() - 1)
  if lang == "de" {
    str(d.day()) + ". " + month + " " + str(d.year())
  } else {
    month + " " + str(d.day()) + ", " + str(d.year())
  }
}

// Picks the entry for `lang` from a (de: …, en: …) dictionary.
#let pick(by-lang, lang) = {
  assert(lang in by-lang, message: "unsupported lang '" + lang + "', use de or en")
  by-lang.at(lang)
}
