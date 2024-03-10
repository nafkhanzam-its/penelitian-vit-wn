#import "/research/globals.typ": *

#headz[TIM RISET]

Bagan organisasi tim peneliti bisa dilihat pada @tab-team.

#fig-tab(
  {
    set text(size: 10pt)
    set enum(indent: 0pt)
    tablex(
      columns: (auto, ..3*(auto,), auto),
      [*No.*],[*Nama*],[*Departemen / \ Fakultas*],[*Posisi di \ Tim Riset*],[*Uraian Tugas*],
      ..(
        data.members
          .enumerate()
          .map(
            ((i, member)) => (
              [#{i+1}],
              [#member.name],
              [#member.department / \ #member.faculty],
              [#member.position],
              member.tasks.map(v => [+ #v]).join()
            )
          )
          .flatten()
      )
    )
  },
  caption: [Organisasi Tim Peneliti.],
) <tab-team>
