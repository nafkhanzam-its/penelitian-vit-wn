#import "/research/globals.typ": *

#headz[BIODATA]

#let bio(index, member) = [
  #let label = if index == 0 {
    [Ketua]
  } else {
    [Anggota #numbering("I", index)]
  }

  == #label

  #[
    Identitas Peneliti

    #{
      show table.cell.where(x: 0): strong
      table(
        columns: 2,
        [Nama Lengkap], [#member.name],
        [Jenis Kelamin], [#member.gender],
        [NIP/NIK], [#member.id-number],
        [NIDN (jika ada)], [#member.nidn],
        [Tempat dan Tanggal Lahir], [#member.birth],
        [E-mail], [#member.email],
        [Nomor Telepon/HP], [#member.phone],
        [Nama Institusi Tempat Kerja], [#member.institution-long],
        [Alamat Kantor], [#member.address],
      )
    }

    #show table.cell.where(y: 0): strong

    Riwayat Pendidikan

    #{
      let s-keys = ("s1", "s2", "s3")

      show table.cell.where(x: 0): strong
      table(
        columns: 4,
        table.header(
          [], [S-1], [S-2], [S-3],
        ),
        ..((
          ([Nama Perguruan Tinggi], "instition-name"),
          ([Bidang Ilmu], "major"),
          ([Tahun Masuk-Lulus], "start-end-year"),
          ([Judul Skripsi / \ Tesis / Disertasi], "thesis-title"),
          ([Nama Pembimbing/Promotor], "supervisor-name"),
        ).map(((title, field)) => (title, ..(s-keys.map(v => [#access-field(member, "education-history", v, field)])))).flatten()),
      )
    }

    Pengalaman Penelitian dalam 5 Tahun Terakhir (Bukan Skripsi, Tesis, dan Disertasi)

    #table(
      columns: 5,
      table.header(
        [No], [Tahun], [Judul Penelitian], [Sumber Dana], [Jumlah Dana],
      ),
      ..gen-rows(member.at("research-history", default: ()), ("year", "title", "funding-source", "funding-amount")),
    )

    Publikasi Artikel Ilmiah Jurnal yang Relevan Dalam 5 Tahun Terakhir

    #table(
      columns: 4,
      table.header(
        [No], [Judul Artikel Ilmiah], [Nama Jurnal], [Volume / Nomor / Tahun],
      ),
      ..gen-rows(member.at("publication-history", default: ()), ("title", "journal-name", "number")),
    )

    Pemakalah Seminar Ilmiah (_Oral Presentation_) yang Relevan Dalam 5 Tahun Terakhir

    #table(
      columns: 4,
      table.header(
        [No], [Judul], [Pemakalah Seminar Ilmiah], [Waktu dan Tempat],
      ),
      ..gen-rows(member.at("seminar-history", default: ()), ("title", "seminar-name", "date-time")),
    )

    Karya Buku dalam 5 Tahun Terakhir

    #table(
      columns: 5,
      table.header(
        [No], [Judul Buku], [Tahun], [Jumlah Halaman], [Penerbit],
      ),
      ..gen-rows(member.at("book-history", default: ()), ("title", "year", "total-page", "publisher")),
    )

    HKI dalam 10 Tahun Terakhir

    #table(
      columns: 5,
      table.header(
        [No], [Judul/Tema HKI], [Tahun], [Jenis], [Nomor P/ID],
      ),
      ..gen-rows(member.at("intellectual-property-history", default: ()), ("title", "year", "type", "number")),
    )

    Pengalaman Merumuskan Kebijakan Publik/Rekayasa Sosial Lainnya dalam 10 Tahun Terakhir

    #table(
      columns: 5,
      table.header(
        [No], [Judul/Tema/Jenis Rekayasa Sosial Lainnya yang Telah Diterapkan], [Tahun], [Tempat Penerapan], [Respon Masyarakat],
      ),
      ..gen-rows(member.at("policy-history", default: ()), ("title", "year", "place", "response")),
    )

    Penghargaan dalam 10 tahun Terakhir (dari pemerintah, asosiasi atau institusi lainnya)

    #table(
      columns: 4,
      table.header(
        [No], [Jenis Penghargaan], [Institusi Pemberi Penghargaan], [Tahun],
      ),
      ..gen-rows(member.at("reward-history", default: ()), ("name", "institution", "year")),
    )
  ]

  #show: text.with(weight: "bold")

  Semua data yang saya isikan dan tercantum dalam biodata ini adalah benar dan dapat dipertanggungjawabkan secara hukum.
  Apabila di kemudian hari ternyata dijumpai ketidaksesuaian dengan kenyataan, saya sanggup menerima sanksi.
  Demikian biodata ini saya buat dengan sebenarnya untuk memenuhi salah satu persyaratan dalam pengajuan.

  #grid(
    columns: (1fr, auto),
    [],
    [
      #member.sign-city, #ID-display-today \
      #label

      #align(center, image("res/signs/" + member.id + ".png", height: 5em))

      (#member.name)
    ]
  )

  #pagebreak()
]

#for (i, member) in data.members.enumerate().slice(0, 2) {
  bio(i, member)
}
