#import "/research/globals.typ": *

#headz[BIODATA]

#let bio(index, member, show-on-zero: true, extend: true) = [
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
        columns: (auto, 1fr),
        [Nama Lengkap],
        [#member.name],
        [Jenis Kelamin],
        [#member.gender],
        [NIP/NIK],
        [#member.id-number],
        [NIDN (jika ada)],
        [#member.nidn],
        [Tempat dan Tanggal Lahir],
        [#member.birth],
        [E-mail],
        [#member.email],
        [Nomor Telepon/HP],
        [#member.phone],
        [Nama Institusi Tempat Kerja],
        [#member.institution-long],
        [Alamat Kantor],
        [#member.address],
      )
    }

    #show table.cell.where(y: 0): strong

    Riwayat Pendidikan

    #{
      let s-keys = ("s1", "s2", "s3")
      let counter = 0
      for key in s-keys {
        if access-field(member, "education-history", key) != none {
          counter += 1
        }
      }

      show table.cell.where(x: 0): strong
      table(
        columns: counter + 1,
        table.header(
          ..(
            [],
            [S-1],
            [S-2],
            [S-3],
          ).slice(0, counter + 1),
        ),
        ..(
          (
            ([Nama Perguruan Tinggi], "instition-name"),
            ([Bidang Ilmu], "major"),
            ([Tahun Masuk-Lulus], "start-end-year"),
            ([Judul Skripsi / \ Tesis / Disertasi], "thesis-title"),
            ([Nama Pembimbing/Promotor], "supervisor-name"),
          ).map(((title, field)) => (
            title,
            ..(s-keys.slice(0, counter).map(v => [#access-field(member, "education-history", v, field)])),
          )).flatten()
        ),
      )
    }

    #let rest-args = (:)
    #let empty-message = access-field(member, "empty-message")
    #if empty-message != none {
      rest-args += (empty-message: empty-message)
    }

    #let arr = member.at("research-history", default: ())
    #let col-n = 5
    #if arr.len() > 0 or show-on-zero [
      #show: block.with(breakable: false)
      Pengalaman Penelitian dalam 5 Tahun Terakhir (Bukan Skripsi, Tesis, dan Disertasi)
      #table(
        columns: if (extend and arr.len() == 0) {
          (auto, ..((col-n - 1) * (1fr,)))
        } else {
          col-n
        },
        table.header(
          [No],
          [Tahun],
          [Judul Penelitian],
          [Sumber Dana],
          [Jumlah Dana],
        ),
        ..gen-rows(arr, ("year", "title", "funding-source", "funding-amount"), ..rest-args),
      )
    ]

    #let arr = member.at("publication-history", default: ())
    #let col-n = 4
    #if arr.len() > 0 or show-on-zero [
      #show: block.with(breakable: false)
      Publikasi Artikel Ilmiah Jurnal yang Relevan Dalam 5 Tahun Terakhir
      #table(
        columns: if (extend and arr.len() == 0) {
          (auto, ..((col-n - 1) * (1fr,)))
        } else {
          col-n
        },
        table.header(
          [No],
          [Judul Artikel Ilmiah],
          [Nama Jurnal],
          [Volume / Nomor / Tahun],
        ),
        ..gen-rows(arr, ("title", "journal-name", "number"), ..rest-args),
      )
    ]

    #let arr = member.at("seminar-history", default: ())
    #let col-n = 4
    #if arr.len() > 0 or show-on-zero [
      #show: block.with(breakable: false)
      Pemakalah Seminar Ilmiah (_Oral Presentation_) yang Relevan Dalam 5 Tahun Terakhir
      #table(
        columns: if (extend and arr.len() == 0) {
          (auto, ..((col-n - 1) * (1fr,)))
        } else {
          col-n
        },
        table.header(
          [No],
          [Judul],
          [Pemakalah Seminar Ilmiah],
          [Waktu dan Tempat],
        ),
        ..gen-rows(arr, ("title", "seminar-name", "date-time"), ..rest-args),
      )
    ]

    #let arr = member.at("book-history", default: ())
    #let col-n = 5
    #if arr.len() > 0 or show-on-zero [
      #show: block.with(breakable: false)
      Karya Buku dalam 5 Tahun Terakhir
      #table(
        columns: if (extend and arr.len() == 0) {
          (auto, ..((col-n - 1) * (1fr,)))
        } else {
          col-n
        },
        table.header(
          [No],
          [Judul Buku],
          [Tahun],
          [Jumlah Halaman],
          [Penerbit],
        ),
        ..gen-rows(arr, ("title", "year", "total-page", "publisher"), ..rest-args),
      )
    ]

    #let arr = member.at("intellectual-property-history", default: ())
    #let col-n = 5
    #if arr.len() > 0 or show-on-zero [
      #show: block.with(breakable: false)
      HKI dalam 10 Tahun Terakhir
      #table(
        columns: if (extend and arr.len() == 0) {
          (auto, ..((col-n - 1) * (1fr,)))
        } else {
          col-n
        },
        table.header(
          [No],
          [Judul/Tema HKI],
          [Tahun],
          [Jenis],
          [Nomor P/ID],
        ),
        ..gen-rows(arr, ("title", "year", "type", "number"), ..rest-args),
      )
    ]

    #let arr = member.at("policy-history", default: ())
    #let col-n = 5
    #if arr.len() > 0 or show-on-zero [
      #show: block.with(breakable: false)
      Pengalaman Merumuskan Kebijakan Publik/Rekayasa Sosial Lainnya dalam 10 Tahun Terakhir
      #table(
        columns: if (extend and arr.len() == 0) {
          (auto, ..((col-n - 1) * (1fr,)))
        } else {
          col-n
        },
        table.header(
          [No],
          [Judul/Tema/Jenis Rekayasa Sosial Lainnya yang Telah Diterapkan],
          [Tahun],
          [Tempat Penerapan],
          [Respon Masyarakat],
        ),
        ..gen-rows(arr, ("title", "year", "place", "response"), ..rest-args),
      )
    ]

    #let arr = member.at("reward-history", default: ())
    #let col-n = 4
    #if arr.len() > 0 or show-on-zero [
      #show: block.with(breakable: false)
      Penghargaan dalam 10 tahun Terakhir (dari pemerintah, asosiasi atau institusi lainnya)
      #table(
        columns: if (extend and arr.len() == 0) {
          (auto, ..((col-n - 1) * (1fr,)))
        } else {
          col-n
        },
        table.header(
          [No],
          [Jenis Penghargaan],
          [Institusi Pemberi Penghargaan],
          [Tahun],
        ),
        ..gen-rows(arr, ("name", "institution", "year"), ..rest-args),
      )
    ]
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

      #{
        show: pad.with(y: -1em)
        align(center, image("res/signs/" + member.id + ".png", height: 5em))
      }

      (#member.name)
    ],
  )

  #pagebreak()
]

#let show-on-zero = access-field(data, "show-bio-on-zero", default: true)
#for (i, member) in data.members.enumerate().slice(0, 2) {
  bio(i, member, show-on-zero: show-on-zero)
}
