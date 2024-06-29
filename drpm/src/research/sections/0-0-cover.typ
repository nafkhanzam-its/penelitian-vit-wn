#import "/research/globals.typ": *

#set par(justify: false)
#set align(center)

#let border-width = 12pt

#show: (body) => {
  set page(margin: 0pt)
  rect(
    width: 100%,
    height: 100%,
    fill: none,
    stroke: border-width + rgb(47, 84, 150),
    pad(3cm - border-width, body),
  )
}

#[
  #set text(weight: "bold", size: 14pt)

  PROPOSAL \
  SKEMA PENELITIAN #upper(data.schema) \
  SUMBER DANA #upper(data.funding-source) \
  TAHUN #display-year

  #v(1fr)

  #image("/res/lambang.png", width: 2.33in)

  #v(1fr)

  #text(size: 16pt, upper(data.title))

  #v(1fr)

  Tim Peneliti:
]

#let write-member-entry(member) = [#member.name / #member.department / #member.faculty / #member.institution]

#pad(x: -1cm)[
  #grid(
    columns: (auto, 1fr),
    [Ketua Peneliti],[: #write-member-entry(data.members.at(0))],
    [Anggota Peneliti],[: 1. #write-member-entry(data.members.at(1))],
    ..(data.members.slice(2).filter(v => not v.at("exclude-from-cover", default: false)).enumerate().map(((i, member)) => ([], [#hide[: ]#{i+2}. #write-member-entry(member)])).flatten())
  )
]

#v(1fr)

#[
  #set text(weight: "bold", size: 12pt)
  DIREKTORAT RISET DAN PENGABDIAN KEPADA MASYARAKAT \
  INSTITUT TEKNOLOGI SEPULUH NOPEMBER \
  SURABAYA \
  #display-year
]
