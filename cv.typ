// CV entry point. Paths are relative to the project root:
//   typst compile --root . cv.typ out.pdf
// Optional inputs: lang=de|en, cv=/cv-en.json, personal=/personal-data-en.json
#import "lib/cv/template.typ": cv

#let input(key, default) = sys.inputs.at(key, default: default)

#cv(
  json(input("personal", "/personal-data.json")),
  json(input("cv", "/cv.json")),
  lang: input("lang", "de"),
)
