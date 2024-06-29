#import "/research/globals.typ": *

#let counter = counter("logbook-counter")

#let counter-disp() = {
  counter.step()
  counter.display()
}

#table(
  columns: 3,
  [*No*], [*Tanggal*], [*Kegiatan*],
  [#counter-disp()],
  [1 Maret 2024],
  [
    Catatan: Rapat diskusi mengenai pengabdian masyarakat untuk Lab. Komputasi berbasis Jaringan dan Lab. Teknologi Jaringan dan Keamanan Siber Cerdas.

    Dokumen Pendukung:
    // #align(center, image("res/meeting.jpeg", fit: "contain"))
  ],

  [#counter-disp()],
  [8 Maret 2024],
  [
    Catatan: Mendapatkan persetujuan kesediaan kerjasama dari Bapak Kepala Sekolah SD Raden Patah.

    Dokumen Pendukung:
    // #align(center, image("res/statement-signed.png", fit: "contain", height: 40%))
  ],

  [#counter-disp()],
  [15 Mei 2024],
  [
    Catatan: Diskusi mengenai pembuatan materi pelatihan.

    Dokumen Pendukung:
    // #align(center, image("res/ppt-discussion.png", fit: "contain", height: 40%))
  ],

  [#counter-disp()],
  [10 Juni 2024],
  [
    Catatan: Diskusi mengenai desain sertifikat pelatihan.

    Dokumen Pendukung:
    // #align(center, image("res/certificate-discussion.png", fit: "contain", height: 40%))
  ],

  [#counter-disp()],
  [18 Juni 2024],
  [
    Catatan: Koordinasi dengan mahasiswa admin lab yang terlibat di pengabdian masyarakat ini.

    Dokumen Pendukung:
    // #align(center, image("res/student-discussion.png", fit: "contain", height: 70%))
  ],
)
