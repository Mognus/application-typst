// Skills profile entry point. Paths are relative to the project root:
//   typst compile --root . ability-sheet.typ out.pdf
// Optional inputs: lang=de|en, abilities=/abilities-en.json, personal=/personal-data-en.json
#import "lib/ability-sheet/template.typ": ability-sheet

#let input(key, default) = sys.inputs.at(key, default: default)

#ability-sheet(
  json(input("personal", "/personal-data.json")),
  json(input("abilities", "/abilities.json")),
  lang: input("lang", "de"),
)
