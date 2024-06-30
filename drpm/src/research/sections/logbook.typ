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
  [4 Juni 2024],
  [
    Diskusi tentang pelaksanaan penelitian online melalui zoom

    Berikut link zoomnya: https://its-ac-id.zoom.us/my/nafkhanzam
  ],

  [#counter-disp()],
  [10-14 Juni 2024],
  [
    Download dataset dan mengolahnya. Berikut adalah hasil plot salah satu data.

    #align(center, image("res/signal.png", fit: "contain"))
  ],

  [#counter-disp()],
  [20-22 Juni 2024],
  [
    Mengolah data hyperspectral menjadi image 2D. Berikut contoh hasilnya

    #align(center, image("res/spectogram.png", fit: "contain"))
    atau
    #align(center, image("res/scalogram.png", fit: "contain"))
  ],

  [#counter-disp()],
  [26-28 Juni 2024],
  [
    Melakukan Ujicoba untuk mendapatkan performa dari metode pembanding. Berikut adalah contoh hasilnya:

    #align(center, image("res/results.png", fit: "contain"))
  ],
)
