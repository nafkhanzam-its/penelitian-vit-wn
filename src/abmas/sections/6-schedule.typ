#import "@preview/timeliney:0.0.1"
#import "/abmas/globals.typ": *

= JADWAL

Kegiatan pengabdian kepada masyarakat ini dijadwalkan akan dijalankan dalam kurun waktu #data.period.
Rincian aktivitas dari setiap proses dapat dilihat pada tabel berikut ini.

#timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *

    headerline(group(([*2024*], 6)))
    headerline(
      group(..range(5, 11)
        .map(v => datetime(year: 2024, month: v, day: 1).display("[month repr:short]"))
        .map(v => strong(v))),
    )

    taskgroup({
      task([Studi literatur], (0, 1))
      task([Uji coba OBS internal], (1, 2))
      task([Perancangan pelatihan], (2, 3))
      task([Penulisan modul pelatihan], (2, 4))
      task([Pelaksanaan pelatihan], (4, 5))
      task([Penggalian umpan balik dari pengguna], (4, 5))
      task([Penyusunan Publikasi Ilmiah], (5, 6))
      task([Penyusunan Laporan Akhir], (5, 6))
    })
  }
)
