# application-typst

Job application documents with [Typst](https://typst.app). Templates are Typst functions and get filled from JSON files.

## Structure

```
application-typst/
├── cover-letter.typ            # entry point: loads JSON, calls the template
├── cv.typ                      # entry point
├── ability-sheet.typ           # entry point
├── lib/
│   ├── theme.typ               # shared: fonts, sizes, colors
│   ├── i18n.typ                # shared: date format, language check
│   ├── header.typ              # shared: name, title, photo, document title
│   ├── section-heading.typ     # shared: uppercase label with rule
│   ├── footer.typ              # shared
│   ├── cover-letter/           # feature: everything only the cover letter uses
│   │   ├── template.typ        # page setup + layout
│   │   ├── sidebar.typ         # name, title, contact
│   │   ├── letter-body.typ     # date, subject, text, signature
│   │   └── i18n.typ            # fixed wording (de/en)
│   ├── cv/                     # feature: everything only the CV uses
│   │   ├── template.typ        # page setup + two-column layout
│   │   ├── contact.typ         # contact table
│   │   ├── entries.typ         # experience and education entries
│   │   └── i18n.typ            # section titles (de/en)
│   └── ability-sheet/          # feature: skills profile
│       ├── template.typ        # page setup + two-column layout
│       ├── ability.typ         # skill name, level bar, keywords
│       ├── balance.typ         # splits categories evenly over both columns
│       └── i18n.typ            # document title (de/en)
├── companies/                  # one JSON per application (gitignored, except example.json)
├── img/                        # your photo (gitignored)
├── personal-data.json          # your data (gitignored)
├── personal-data-template.json # copy this to get started
├── cv.json                     # your CV content (gitignored)
├── cv-template.json            # copy this to get started
├── abilities.json              # your skills (gitignored)
├── abilities-template.json     # copy this to get started
└── build.sh
```

Files directly in `lib/` are shared. Each folder in `lib/` is one feature and imports only from `lib/`, never from another feature.

## Setup

```bash
sudo pacman -S typst
cp personal-data-template.json personal-data.json
cp cv-template.json cv.json
cp abilities-template.json abilities.json
mkdir img   # put your photo here and set "photo" in personal-data.json
```

## Usage

```bash
./build.sh companies/example.json        # -> gen/cover-letter/cover-letter-example.pdf
./build.sh companies/example.json --en   # -> gen/cover-letter/cover-letter-en-example.pdf
./build.sh cv                            # -> gen/cv/cv.pdf
./build.sh cv --en                       # -> gen/cv/cv-en.pdf
./build.sh abilities                     # -> gen/ability-sheet/ability-sheet.pdf
./build.sh abilities --en                # -> gen/ability-sheet/ability-sheet-en.pdf
```

`--en` switches the fixed wording and uses the `-en` variants of the JSON files (`personal-data-en.json`, `cv-en.json`, `abilities-en.json`).

While writing, `typst watch` rebuilds on every save:

```bash
typst watch --root . --input job=/companies/example.json cover-letter.typ
```

## Company JSON

```json
{
  "company": "Acme GmbH",
  "job_title": "Backend Developer",
  "salutation": "Sehr geehrte Damen und Herren,",
  "content": "First paragraph.\n\nSecond paragraph."
}
```

`content` is plain text. A blank line (`\n\n`) starts a new paragraph.

## CV JSON

See `cv-template.json`. The CV content lives only in the gitignored `cv.json` / `cv-en.json`, so it never ends up in the repository. `detail` in `education` is optional.

## Abilities JSON

See `abilities-template.json`. `level` goes from 0 to 10, `keywords` is optional. Categories are split over two columns so both hold about the same number of skills; a category is never split.
