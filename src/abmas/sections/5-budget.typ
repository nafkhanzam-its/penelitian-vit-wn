#import "/abmas/globals.typ": *

= ANGGARAN

#gridx(
  columns: 3,
  [Judul Pengabdian], [:], [#data.title],
  [Ketua], [:], [#data.members.at(0).name],
  [Departemen], [:], [#data.department],
  [Fakultas], [:], [#data.faculty],
  [Alokasi Dana Sub Judul], [:], [#print-rp(data.budget.total)],
)

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
