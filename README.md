# application-typst

Job application documents with [Typst](https://typst.app). Templates are Typst functions and get filled from JSON files.

## Structure

```
application-typst/
├── cover-letter.typ            # entry point: loads JSON, calls the template
├── lib/
│   ├── theme.typ               # shared: fonts, sizes, colors
│   ├── i18n.typ                # shared: date format, language check
│   ├── section-heading.typ     # shared: uppercase label with rule
│   ├── footer.typ              # shared
│   └── cover-letter/           # feature: everything only the cover letter uses
│       ├── template.typ        # page setup + layout
│       ├── sidebar.typ         # name, title, contact
│       ├── letter-body.typ     # date, subject, text, signature
│       └── i18n.typ            # fixed wording (de/en)
├── companies/                  # one JSON per application (gitignored, except example.json)
├── personal-data.json          # your data (gitignored)
├── personal-data-template.json # copy this to get started
└── build.sh
```

Files directly in `lib/` are shared. Each folder in `lib/` is one feature and imports only from `lib/`, never from another feature.

## Setup

```bash
sudo pacman -S typst
cp personal-data-template.json personal-data.json
```

## Usage

```bash
./build.sh companies/example.json        # -> gen/cover-letter/cover-letter-example.pdf
./build.sh companies/example.json --en   # -> gen/cover-letter/cover-letter-en-example.pdf
```

`--en` switches the fixed wording and uses `personal-data-en.json`.

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
