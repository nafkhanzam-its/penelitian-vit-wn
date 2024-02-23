#import "/abmas/globals.typ": *

#let cl-blue = rgb(32, 64, 106)
#let cl-yellow = rgb(255, 210, 46)

#set text(fill: white)
#set page(fill: cl-blue, margin: 0em)
#set par(justify: false)
#set align(center)

#show: pad.with(x: 2em)

#v(1fr)

#[
  #set text(weight: "bold", size: 20pt)

  PROPOSAL \
  PENGABDIAN KEPADA MASYARAKAT \
  SKEMA #upper(data.schema) DANA #upper(data.funding-source)

  #v(1fr)

  #image("/res/lambang.png", width: 2.33in)

  #v(1fr)

  #set text(size: 18pt)

  #upper[#data.title]

  Lokasi : #data.partner.address

  #v(1fr)
]

#let write-member-entry(member) = [#member.name (#member.department/#member.faculty)]

#[
  #set text(size: 14pt)

  #text(size: 16pt)[*Tim Pengabdi:*] \
  #for member in data.members [
    #write-member-entry(member) \
  ]
]

#v(1fr)

#show: pad.with(x: -2em)

#block(fill: cl-yellow, width: 100%, inset: (x: 1em, y: 3em))[
  #set text(fill: cl-blue)
  #set text(weight: "bold", size: 18pt)

  DIREKTORAT RISET DAN PENGABDIAN KEPADA MASYARAKAT \
  INSTITUT TEKNOLOGI SEPULUH NOPEMBER \
  SURABAYA #display-year
]

