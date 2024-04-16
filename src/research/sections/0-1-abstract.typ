#import "/research/globals.typ": *

#headz[RINGKASAN/ABSTRAK]

Identifikasi dini penyakit pada tanaman sangat penting untuk mengurangi kerugian hasil panen dan untuk meningkatkan ketahanan pangan.
Hal ini karena, jika suatu panyakit terlambat untuk dideteksi, dengan kata lain penyakit tersebut terdeteksi ketika sudah parah, maka pengobatanya akan sangat sulit dan kemungkinan penyakit tersebut akan menular ke tanaman yang lain akan semakin besar.
Hal tersebut bisa mengancam terjadinya gagal panen.
Oleh karena itu, pendeteksian dini penyakit pada tanaman sebelum gejala visualnya muncul sangat penting.

Salah satu informasi yang bisa digunakan untuk mendeteksi dini penyakit pada tanaman adalah dengan menggunakan informasi hiperspektral.
Hal ini karena informasi hiperspektral dari tanaman mampu mencerminkan kondisi jaringan suatu tanaman.
Dimana ketika suatu tanaman terserang penyakit, di tahap awal jaringan di dalam tanaman tersebut akan memberikan respon terhadap penyakit tersebut.

Problemnya adalah informasi hiperspektral mempunyai dimensi yang tinggi dan sangat redundan.
Oleh karena itu, pengolahan informasi hiperspektral untuk deteksi dini penyakit pada tanaman sangat sulit.
Dalam penelitian sebelumnya, kami sudah mengusulkan suatu metode berbasis deep learning yang menggukan dilated convolution dan channel attention modul untuk mengolah informasi hiperspektral tersebut.
Metode tersebut kami berinama SC-CAN dan sudah kami terbitkan di dalam jurnal Q1.
Namun ternyata penggunaan dilated convolution kurang efektif untuk mengekstrak fitur global.
Oleh karena itu, kami mencoba untuk menggunakan metode deep learning berbasis Transformer yang kami beri nama dengan MCE-ST untuk menyelesaikan problem tersebut.
Metode MCE-ST ini juga sudah kami terbitkan di dalam jurnal Q1.
Walaupun MCE-ST sudah merupakan state-of-the-art, namun akurasi dari metode tersebut masih perlu ditingkatkan sebelum diaplikasikan ke dalam dunia nyata.
Literatur-literatur sebelumnya menyebutkan bahwa ketika suatu network berbasis Transformer dilatih menggunakan data yang banyak, maka akurasinya meningkat. Oleh karena itu, pada penelitian ini, kami ingin memanfaatkan network berbasis Transformer yang sudah dilatih menggunakan data yang banyak (pre-trained Transformer). Namun, karena pre-trained Transformer untuk data hyperspektral yang berupa sinyal belum ada, kami akan menggunakan pre-trained Transformer yang sebenarnya digunakan untuk data dengan modal yang berbeda. 
Salah satunya adalah pretrained ViT (Vision Transformer) yang sejatinya digunakan untuk data gambar. Agar pretrained ViT tersebut bisa digunakan untuk data hiperspektral yang berupa sinyal, di dalam penelitian ini kami akan memodifikasi pretrained ViT dan menambahkan modul untuk mengubah data sinyal menjadi gambar.

Kata Kunci: identifikasi dini penyakit pada tanaman, informasi hyperspectral, ViT untuk data sinyal
