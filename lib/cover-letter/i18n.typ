// Fixed wording of the cover letter. The letter text itself comes from the company JSON.

#let strings = (
  de: (
    contact: "Kontakt",
    subject: (job-title, company) => "Bewerbung als " + job-title + " bei " + company,
    closing: "Mit freundlichen Grüßen",
  ),
  en: (
    contact: "Contact",
    subject: (job-title, company) => "Application for " + job-title + " at " + company,
    closing: "Sincerely",
  ),
)
