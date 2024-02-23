#import "/abmas/globals.typ": *

= BIODATA TIM PENGABDI

#let bio(member, index: none) = [
  #let label = if index == none {
    panic("index must not be none.")
  } else if index == 0 {
    [Ketua]
  } else {
    [Anggota #numbering("I", index)]
  }

  == #label

  #pad(left: 2em)[
    #gridx(
      columns: 3,
      [Nama Lengkap], [:], [#member.name],
      [Jenis Kelamin], [:], [#member.gender],
      [NIP], [:], [#member.id],
      [Fungsional/Pangkat/Gol.], [:], [#member.functional],
      [Bidang Keahlian], [:], [#member.expertise],
      [Departemen/Fakultas], [:], [#member.department / #member.faculty],
      [Perguruan Tinggi], [:], [#member.institution],
      // [Alamat Rumah dan No. Telp.], [:], [#member.address / #member.phone],
    )
  ]

  #let MAX-CONTENT = 2

  Riwayat pengabdian (2 terakhir yang didanai ITS atau nasional, sebutkan sebagai Ketua atau Anggota)

  #table(
    columns: (auto, 1fr, auto, auto),
    [*No*], [*Judul Pengabdian kepada Masyarakat*], [*Penyandang Dana*], [*Tahun*],
    ..{
      let arr = member.at("abmas-history", default: ())
      let cells = arr
        .slice(0, calc.min(arr.len(), MAX-CONTENT))
        .enumerate()
        .map(((i, v)) => (
          [#(i+1)], [#v.title], [#v.funding-source], [#v.year],
        )).flatten()
      for _ in range(MAX-CONTENT - arr.len()) {
        cells.push((hide[1], [], [], []))
      }
      cells.flatten()
    }
  )

  Publikasi ilmiah (2 terakhir dalam bentuk makalah atau buku)

  #tablex(
    columns: (auto, 1fr, 12em),
    [*No*], [*Judul Artikel Pengabdian kepada Masyarakat*], [*URL Artikel*],
    ..{
      let arr = member.at("publication-history", default: ())
      let cells = arr
        .slice(0, calc.min(arr.len(), MAX-CONTENT))
        .enumerate()
        .map(((i, v)) => (
          [#(i+1)], [#v.title], link(v.url),
        )).flatten()
      for _ in range(MAX-CONTENT - arr.len()) {
        cells.push((hide[1], [], []))
      }
      cells.flatten()
    }
  )

  HKI (2 terakhir)

  #tablex(
    columns: (auto, 1fr, auto, auto),
    [*No*], [*Judul Hak Kekayaan Intelektual*], [*Jenis HKI*], [*No. HKI*],
    ..{
      let arr = member.at("intellectual-property-history", default: ())
      let cells = arr
        .slice(0, calc.min(arr.len(), MAX-CONTENT))
        .enumerate()
        .map(((i, v)) => (
          [#(i+1)], [#v.title], [#v.type], [#v.id],
        )).flatten()
      for _ in range(MAX-CONTENT - arr.len()) {
        cells.push((hide[1], [], [], []))
      }
      cells.flatten()
    }
  )
]

#for (i, member) in data.members.enumerate() {
  bio(member, index: i)
}
