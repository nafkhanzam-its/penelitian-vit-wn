#import "/abmas/globals.typ": *

= PETA LOKASI

#gridx(
  columns: 3,
  [Nama Instansi Mitra], [:], [#data.partner.institution],
  [Alamat Mitra], [:], [#data.partner.address],
  [Jarak ITS - Lokasi Mitra], [:], [#data.partner.distance],
)

#image("res/map-location.png", width: 100%)
