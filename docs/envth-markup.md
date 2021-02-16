---
title: Envth markup pipeline
author: Trevor Cook
background-image: template-slide
header-includes: |
    \usepackage{graphicx}
---

## Objective

### Demonstrate `envth` Markup Environment

- Use
- Images
- Templates

## Use

- Expects markup in `$markupdir` and images in `$markupdir/img`
- `markupdir` defaults to `./doc`
- Render with the `envlib` function:
```
> markup-doc filebasename
```

## Images
::::::{.columns}
::: {.column width="50%"}

- Place `.svg` images in `$markupdir/img`
- Rendered to `.pdf` on each `markup-doc` call
- Uses `inkscape`
:::
::: {.column width="50%"}
\includegraphics[width=1\textwidth]{img/image-1}
:::
::::::

## Template

- An example of a simple template is included
- A single page `.pdf` that is set as a background image

## Notes

- The output is not viewable on Acrobat for linux.
- Don't know why. Pandoc? Embedded inkscape generated pdfs?
- Envince works fine
