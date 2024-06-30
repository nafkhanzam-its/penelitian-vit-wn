#import "/research/globals.typ": *
#import "/data/results.typ": generate-baseline-results-table

= HASIL PELAKSANAAN PENELITIAN

Beberapa Tahap dari Penelitian yang sudah dilaksankan adalah sebagai berikut:

== Pengumpulan Dataset

Dataset yang akan kami gunakan untuk uji coba awal adalah dataset “Cassava Spectral and Image Dataset” yang kami dapat dari Havard Dataverse.
Dataset tersebut mengandung data spectral tanaman ubi jalar yang sehat, yang terserang penyakit mosaic dan brown streak.
Dataset tersebut bisa diakses di link berikut: https://dataverse.harvard.edu/file.xhtml?fileId=6419439&version=5.0.
Berikut adalah contoh dataset yang kami hasilkan:

#fig-img(
  image("res/signal.png", width: 75%),
  caption: [Contoh data hyperspectral jika digambarkan dalam bentuk grafik.],
  placement: none,
) <img-signal>

== Implementasi Modul yang tepat untuk mengubah data hiperspektral ke dalam bentuk gambar

Short Term Fourier Transform (STFT) adalah salah satu metode yang dapat menggambarkan frekuensi sinusoidal terhadap waktu.
Dengan input sinyal terhadap waktu, STFT ini mampu merubah sinyal ke dalam image 2 dimensi.
Problem yang akan diselesaikan di dalam penelitian ini, datanya bukan sinyal terhadap waktu melainkan sinyal terhadap panjang gelombang.
Tapi kami berpendapat jika kami bisa memanfaatkan STFT ini untuk data hiperspektral, maka itu akan menjadi kontribusi tersendiri di dalam bidang yang kami teliti.

*Input*: sinyal hyperspectral seperti pada @img-signal.

*Output*: gambar 2D yang contohnya ditunjukkan pada @img-spectogram.

#fig-img(
  image("res/spectogram.png", width: 75%),
  caption: [Contoh hasil dari STFT.],
  placement: auto,
) <img-spectogram>

Selain menggunakan metode STFT, kami juga mencoba untuk mengubah sinyal hyperspectral ke dalam gambar menggunakan Wavelet yang hasilnya ditunjukkan pada @img-scalogram.

#fig-img(
  image("res/scalogram.png", width: 75%),
  caption: [Contoh hasil dari Wavelet.],
  placement: auto,
) <img-scalogram>

== Melakukan ujicoba untuk metode baseline

Sebagai langkah awal untuk mendapat performa dari baseline method, yang nantinya akan kami gunakan sebagai metode pembanding, kami melakukan uji coba identifakasi penyakit paada tanaman ketelah dengan data yang sudah kami olah menggunakan metode-bmetode seperti SVM, kNN, CNN, dan Random Forest.
Tujuannya adalah jika nantinya hasil uji coba dari metode yang kami usulkan lebih bagus dari pada metode baseline tersebut, kami akan langsung menyelesaikan tahap berikutnya yaitu membuat karya tulis.
Namun jika hasil uji coba kami masih kurang, kami harus menganalisa kekurangannya dan memperbaiki metode yang kami usulkan terlebih dahulu.
Adapun hasil dari metode base-line tersebut ditunjukkan pada @tab-baseline.

#fig-tab(
  generate-baseline-results-table(),
  caption: [Performa Identifikasi Penyakit pada Tanaman Singkong Menggunakan Data Hyperspectral.],
) <tab-baseline>
