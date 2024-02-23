#let outline-entry-fn(prefix-count, start-level: 1) = it => {
  let loc = it.element.location()
  let num = numbering(loc.page-numbering(), ..counter(page).at(loc))
  let prefixed = it.body.at("children", default: ()).len() > 1
  let body = it.body
  if prefixed {
    body = it.body.at("children").slice(1 + prefix-count).join()
  }
  link(
    loc,
    box(
      grid(
        columns: 3,
        row-gutter: 0pt,
        {
          for _ in range(it.level - start-level) {
            box(width: 1em)
          }
          if prefixed {
            it.body.at("children").slice(0, 1 + prefix-count).join()
            h(4pt)
          }
        },
        [#body#box(width: 1fr)[#it.fill]],
        align(bottom)[#num],
      )
    )
  )
}

#let template(pintorita: false, ref-style: "apa", appendices: none, body) = {
  set page(
    paper: "a4",
    margin: 3cm,
    number-align: right,
  )
  set par(justify: true, leading: 1em, linebreaks: "simple")
  set text(font: "Nimbus Roman No9 L", size: 12pt, fallback: false, hyphenate: false)
  set enum(indent: 1em, spacing: 1.5em, tight: false)
  set block(below: 1.5em)
  set heading(
    numbering: (num1, ..nums) => {
      if nums.pos().len() == 0 {
        [BAB #numbering("I", num1)] + "\t"
        h(10pt, weak: true)
      } else {
        numbering("1.1", num1, ..nums)
        h(7pt, weak: true)
      }
    }
  )
  set bibliography(style: ref-style)

  if pintorita {
    import "@preview/pintorita:0.1.0"
    show raw.where(lang: "pintora"): it => pintorita.render(it.text)
  }
  show table: it => {
    set par(justify: false)
    it
  }
  show grid: it => {
    set par(justify: false)
    it
  }
  show outline.entry: outline-entry-fn(1)
  show heading: it => {
    if it.level == 1 {
      set align(center)
      set text(size: 18pt, weight: "bold")
      it
      v(1.5em, weak: true)
    } else {
      set align(left)
      set text(size: 12pt, weight: "bold")
      it
      v(1.5em, weak: true)
    }
  }

  body

  if appendices != none {
    set page(numbering: "1")
    counter(heading).update(0)

    set heading(
      supplement: "Lampiran",
      numbering: (..nums) => {
        let arr = nums.pos()
        if arr.len() == 0 {
          []
        } else if arr.len() == 1 {
          [LAMPIRAN #numbering("1", ..arr).] + "\t"
        } else {
          numbering("1.", ..arr.slice(1))
        }
      },
    )

    show heading.where(level: 2): set heading(outlined: false)

    appendices
  }
}