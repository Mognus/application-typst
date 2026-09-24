// Cover letter entry point. Paths are relative to the project root:
//   typst compile --root . --input job=/companies/example.json cover-letter.typ out.pdf
// Optional inputs: lang=de|en, personal=/personal-data-en.json
#import "lib/cover-letter/template.typ": cover-letter

#let input(key, default) = sys.inputs.at(key, default: default)

#cover-letter(
  json(input("personal", "/personal-data.json")),
  json(input("job", "/companies/example.json")),
  lang: input("lang", "de"),
)
