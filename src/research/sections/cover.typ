#import "/research/globals.typ": *

#[
  #set text(weight: "bold", size: 14pt)
  #set align(center)

  PROPOSAL \
  SKEMA PENELITIAN #data.schema \
  SUMBER DANA #data.funding-source \
  TAHUN #display-year

  #v(1fr)

  #image("/res/lambang.png", width: 2.33in)

  #v(1fr)

  #text(size: 16pt, upper(data.title))

  #v(1fr)

  Tim Peneliti:
]

#let write-member-entry(member) = [#member.name / #member.department / #member.faculty / #member.institution]

#let member-counter = counter("member-counter-cover")
#let next-member-counter() = {
  member-counter.step()
  member-counter.display()
}

#gridx(
  columns: (1fr, 3fr),
  [Ketua Peneliti],[: #write-member-entry(data.leader)],
  [Anggota Peneliti],[: #next-member-counter(). #write-member-entry(data.members.at(0))],
  ..(data.members.slice(1).map((member) => ([], [#hide[: ]#next-member-counter(). #write-member-entry(member)])).flatten())
)

#v(1fr)

#[
  #set text(weight: "bold", size: 12pt)
  #set align(center)
  DIREKTORAT RISET DAN PENGABDIAN KEPADA MASYARAKAT \
  INSTITUT TEKNOLOGI SEPULUH NOPEMBER \
  SURABAYA \
  #display-year
]
