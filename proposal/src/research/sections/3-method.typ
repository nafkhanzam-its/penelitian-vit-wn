#import "/research/globals.typ": *

= METODE

Metode dan cara untuk mencapai tujuan yang telah ditetapkan dalam penelitian ini terdiri dari beberapa tahap.
Adapun tahapan dan tanggung jawab masing-masing peneliti secara umum ditunjukkan pada diagram alir penelitian yang ditampilkan pada @img-method.

#fig-img(
  image("res/method.png"),
  caption: [Tahapan penelitian dan tanggung jawab masing-masing peneliti.],
) <img-method>

*Tahapan Penelitian:*
+ *Review Literatur* \
  Tahapan pertama yang sedang peneliti lakukan adalah melakukan studi literatur. Ada 2 hal utama yang peneliti pelajari di dalam studi literatur yaitu: 1) metode yang dapat merubah sinyal hiperspektral menjadi image 2) bagaimana bisa memanfaatkan ViT untuk data yang jumlah data latihnya terbatas.
+ *Pengumpulan dataset* \
  Dataset yang akan kami gunakan untuk uji coba awal adalah dataset “Cassava Spectral and Image Dataset” yang kami dapat dari Havard Dataverse. Dataset tersebut mengandung data spectral tanaman ubi jalar yang sehat, yang terserang penyakit mosaic dan brown streak. Dataset tersebut bisa diakses di link berikut: https://dataverse.harvard.edu/file.xhtml?fileId=6419439&version=5.0. \
  *Output:* dataset
+ *Implementasi Modul yang tepat untuk mengubah data hiperspektral ke dalam bentuk gambar.* \
  Short Term Fourier Transform (STFT) adalah salah satu metode yang dapat menggambarkan frekuensi sinusoidal terhadap waktu. Dengan input sinyal terhadap waktu, STFT ini mampu merubah sinyal ke dalam image 2 dimensi. Problem yang akan diselesaikan di dalam penelitian ini, datanya bukan sinyal terhadap waktu melainkan sinyal terhadap panjang gelombang. Tapi kami berpendapat jika kami bisa memanfaatkan STFT ini untuk data hiperspektral, maka itu akan menjadi kontribusi tersendiri di dalam bidang yang kami teliti. \
  *Input:* sinyal hyperspectral \
  *Output:* gambar 2D
+ *Melakukan percobaan terhadap Vision Transformer (ViT)* \
  ViT adalah metode Transformer yang diadopsi untuk input berupa data gambar. Metode ini sangat unggul dalam menyelesaikan problem-problem yang berkaitan dengan visi computer seperti pengenalan wajah, pengenalan objek, dll. Berbeda dengan problem tersebut, kami akan mencoba mengadopsi ViT untuk mengenali gambar hasil dari modul sebelumnya. \
  *Input:* gambar 2D \
  *Output:* kelas/label dari gambar
+ *Menggabungkan modul yang diusulkan dengan ViT* \
  Karena modul STFT dan ViT pada awalnya adalah modul yang berdiri sendiri, di dalam penelitian ini kami akan mencoba menggabungkan kedua modul tersebut menjadi satu kesatuan.\
  *Input:* sinyal hyperspectral\
  *Output:* kelas dari sinyal hyperspektral
+ *Melakukan ujicoba* \
  Setelah proses pembuatan aplikasi yang isinya adalah modul-modul yang sudah kami usulkan selesai. Langkah berikutnya adalah kami akan melakukan uji coba untuk mengetahui performa dari metode yang kami usulkan. Jika hasil uji coba kami bagus, kami akan langsung menyelesaikan tahap berikutnya yaitu membuat karya tulis. Namun jika hasil uji coba kami masih kurang, kami harus menganalisa kekurangannya dan memperbaiki metode yang kami usulkan terlebih dahulu.
+ *Pembuatan laporan dan karya tulis* \
  Tahap akhir penelitian ini adalah membuat karya tulis yang nantinya akan di masukkan ke dalam jurnal Q1 dan membuat laporan akhir penelitian.