# Curriculum Vitae — Júlio Silva

CV built with [Typst](https://typst.app/), compiled via Docker, and compressed with Ghostscript.

## Requirements

- Docker
- Ghostscript (`gs`)

## Build

```sh
make build
```

Output: `output/CV_JULIO_SILVA.pdf`

## Structure

```
cv/
  curriculum.typ        # Main document (layout + header)
  config.typ            # Personal info — edit this to update contact details
  template.typ          # Shared components: colors, section headers, tags, event entries
  sections/
    experience.typ
    skills.typ
    education.typ
    languages.typ
    links.typ
  profile.jpg
```

## Customization

- Personal details → `cv/config.typ`
- Content → `cv/sections/*.typ`
- Colors / components → `cv/template.typ`
- Layout → `cv/curriculum.typ`
