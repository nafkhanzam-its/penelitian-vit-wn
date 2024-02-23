#import "@preview/timeliney:0.0.1"
#import "/research/globals.typ": *

= JADWAL KEGIATAN

Jadwal detil kegiatan penelitian ditunjukkan pada @tab-schedule.

#figure(
  timeliney.timeline(
    show-grid: true,
    {
      import timeliney: *

      headerline(group(([*Bulan ke*], 9)))
      headerline(
        group(..range(1, 10)
          .map(v => strong[#v])),
      )

      taskgroup({
        task([Studi literatur], (0, 1))
        task([Desain model secara Keselurahan], (1, 2))
        task([Implementasi modul], (2, 5))
        task([Implementasi modul ViT Transformer], (2, 5))
        task([Implementasi penggabungan 2 modul di atas], (2, 5))
        task([Uji Coba], (4, 6))
        task([Menulis hasil penelitian ke dalam karya tulis ilmiah], (6, 8))
        task([Menulis Laporan Akhir], (8, 9))
      })
    }
  ),
  caption: [Jadwal kegiatan penelitian.],
) <tab-schedule>
