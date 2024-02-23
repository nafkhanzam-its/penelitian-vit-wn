#import "/abmas/globals.typ": *
#import "@nafkhanzam/drpm-template:0.0.1": template

#let partner = data.partner

#let title = "Surat Pernyataan Kesediaan Kerjasama dari Mitra"

#show: template
#set document(title: title)

#headz(text(size: 14pt, title))

Yang bertanda tangan di bawah ini kami:

#pad(left: 2em)[
  #gridx(
    columns: 3,
    [Nama], [:], [#partner.person],
    [Jabatan], [:], [#partner.position],
    [Identitas (NIK/NIP)], [:], [#partner.id],
    [Mewakili Instansi], [:], [#partner.institution],
    [Alamat Instansi], [:], [#partner.address],
  )
]

Menyatakan kesediaan instansi kami untuk bekerjasama sebagai mitra dalam kegiatan pengabdian kepada masyarakat dengan tim dari ITS sebagai berikut:

#pad(left: 2em)[
  #gridx(
    columns: 3,
    [Judul Pengabdian], [:], [#data.title],
    [Ketua Tim Pengabdi], [:], [#data.members.at(0).name],
    [Kontribusi Mitra], [:], [#partner.contribution-to-partner],
    [Jangka waktu kerjasama], [:], [#data.period],
  )
]

dan bahwa instansi kami bersedia untuk memenuhi peran / tugas / kontribusi sebagai mitra sebagai berikut: memberikan kelengkapan data-data yang diperlukan oleh tim pengabdi untuk pelaksanaan kegiatan pengabdian masyarakat.
Surat pernyataan ini kami buat dengan sebenarnya untuk digunakan seperlunya.

#v(4em)

#h(1fr)
#box[
  #partner.city, #ID-display-today

  #v(5em)

  #underline[#partner.person]
]
