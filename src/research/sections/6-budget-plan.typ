#import "/research/globals.typ": *

= RENCANA ANGGARAN DAN BIAYA

Adapun total rencana anggaran belanja untuk penelitian adalah #print-rp(data.budget.total) dan rincian ditunjukkan pada tabel berikut ini.

#for (i, key) in BUDGET-KEYS.enumerate() {
  let bd = data.budget.at(key)
  let title-i = numbering("A", i+1)
  tablex(
    // columns: (auto, 1fr, ..5*(auto,)),
    columns: 7,
    [*#title-i*],colspanx(6)[*#bd.title*],..(()*5),
    [*No*],[*Komponen*],[*Item*],[*Satuan*],[*Volume*],[*Biaya satuan*],[*Jumlah*],
    ..bd.items
      .enumerate()
      .map(((j, item)) =>
        ([#{j+1}],[#item.component],[#item.item],[#item.unit],[#item.volume],[#print-rp(item.price)],[#print-rp(item.total)])
      )
      .flatten(),
    colspanx(6, align(center, [*SUB TOTAL #title-i*])),..(()*5),[*#print-rp(bd.total)*],
  )
}

*TOTAL BIAYA #print-rp(data.budget.total)*
