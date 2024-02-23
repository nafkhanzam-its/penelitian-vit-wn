= PENDAHULUAN

== Latar Belakang

Penyakit pada tanaman pangan dapat disebabkan oleh faktor abiotik (misalnya: kadar garam yang berlebih, kekeringan, dan suhu ekstrim) atau faktor biotik (misalnya: pathogen seperti jamur dan serangga) (Sarwat et al., 2016).
Penyakit tersebut mempengaruhi pertumbuhan dan produktivitas tanaman (Suzuki et al., 2014) dan dapat diidentifikasi dengan mengamati gejala visual yang tampak (Wang et al., 2021).
Namun, ketika gejala visual muncul, seringnya penyakit tersebut sudah parah dan sudah terlambat untuk mengobatinya, sehingga mengancam adanya kerugian hasil panen.

Sementara itu, ketika tanaman terserang penyakit pertama kali, tanaman tersebut memberikan respon awal terhadap penyakit tersebut dalam bentuk perubahan kandungan klorofil serta metabolisme sel dan degradasi jaringan (Mahlein et al., 2017).
Perubahan ini pada gilirannya mempengaruhi reflektansi spektral pada tanaman, yang dapat ditangkap oleh sensor hiperspektral.
Oleh karena itu, informasi spektral (intensitas pantulan per pita gelombang dalam data hiperspektral) dapat dimanfaatkan untuk deteksi dini penyakit pada tanaman.

Karena kemampuannya tersebut, sensor hiperspektral menjadi populer di bidang pertanian dengan aplikasi dalam pengelolaan tanaman, pemantauan tanaman, pemetaan tanaman, dan deteksi penyakit tanaman (Ang & Seng, 2021; Lei et al., 2021; Sonobe et al., 2021).
Sensor ini memberikan informasi spektral, yang dapat digunakan untuk menilai kesehatan tanaman dengan memantau kadar air, laju transpirasi daun, struktur jaringan, atau pigmentasi (Plaza et al., 2009; West et al., 2010).
Misalnya, penyakit atau stres dapat menyebabkan perubahan pigmentasi, reaksi hipersensitif, atau degradasi dinding sel (Blackburn, 2007; West et al., 2010).

Namun, penggunaan informasi hiperspektral untuk deteksi penyakit pada tanaman (atau klasifikasi penyakit tanaman) sangat menantang karena informasi hiperspektral berdimensi tinggi dan sangat redundan (Ang & Seng, 2021).
Beberapa penelitian sudah dilakukan untuk mengurangi jumlah dimensi dan tingkat redundansi pada data hiperspektral.
Metode pemilihan fitur ansambel diusulkan untuk mengidentifikasi 15 pita spektral paling penting (dari 215) untuk fenotipe tanaman (Moghimi et al., 2018).
Penelitian lain (Khotimah et al., 2020; Roy et al., 2019; Zhong et al., 2018) menggunakan principal component analysis (PCA) untuk mengurangi dimensi pita spektral.

Selain itu, data hiperspektral memiliki fitur lokal dan global yang sulit untuk diekstraksi.
Menangkap fitur global (pola ketergantungan panjang) menggunakan pendekatan deep learning yang umum, seperti Convolutional Neural Network (CNN), Recurrent Neural Network (RNN), Long Short-Term Memory (LSTM) dan Gated Recurrent Units (GRU), sangat sulit.
Meskipun CNN bagus dalam menangkap fitur lokal, CNN memerlukan jaringan yang sangat dalam dengan banyak parameter yang dapat menyebabkan penyesuaian berlebihan untuk menangkap fitur global (Peng et al., 2021).
Selain itu, performa jaringan deep CNN juga terpengaruh oleh masalah difusi gradien dan degradasi jaringan, yang dapat secara signifikan mengurangi performanya (Rao, Qu, et al., 2022).
RNN juga tidak cocok untuk rangkaian data yang panjang karena rentan terhadap masalah hilangnya gradien atau nilai gradien mendekati nol (Zhou et al., 2019).
Meskipun LSTM cocok untuk data urutan panjang, namun rentang perhatiannya terbatas sehingga kurang cocok untuk data hiperspektral (Lea et al., 2017).

Sementara itu, akhir-akhir ini muncul model deep learning baru bernama Transformer yang unggul dalam menangkap pola ketergantungan panjang suatu rangkaian (Khan et al., 2022; Vaswani et al., 2017).
Model ini mempunyai mekanisme self-attention yang membuat Transformer mampu mempelajari dengan lebih baik hubungan antara berbagai elemen dalam suatu data.
Hal tersebut membuat Transformer unggul dalam menyelesaikan beberapa problem di berbagai area: pada NLP (misalnya, untuk meringkas artikel, menjawab pertanyaan, dan klasifikasi teks), pada visi komputer (misalnya, untuk klasifikasi gambar, segmentasi gambar, dan penerjemahan gambar) (Khan et al., 2022), dan pada penginderaan jauh (misalnya klasifikasi citra penginderaan jauh dan deteksi target citra hiperspektral) (Jamali et al., 2022; Rao, Gao, et al., 2022).
Model Transformer sangat efektif dalam mengekstraksi fitur global dari data gambar hiperspektral dengan ketergantungan spektral yang panjang, terutama dalam konteks deteksi target (Rao, Gao, et al., 2022).

Namun, Transformer dikenal sebagai model yang haus akan data latih (Hassani et al., 2021) dan berperforma baik saat dilatih dengan kumpulan data yang besar.
Pada penelitian sebelumnya, (Dosovitskiy et al., 2021) telah menunjukkan bahwa Vision Transformer (ViT) mencapai akurasi 30% lebih baik saat dilatih dengan 300 juta gambar dibandingkan saat dilatih dengan hanya 10 juta gambar.

Masalah timbul ketika akan menggunakan Transformer untuk deteksi dini penyakit pada tanaman menggunakan data hiperspektral.
Pasalnya, di dalam problem yang akan di selesaikan, data hiperspektral yang tersedia sangat terbatas, hanya beberapa ribu sampel data saja.
Selain itu, sebelumnya belum pernah ada model Transformer yang dilatih menggunakan data hiperspektral.
Oleh karena itu, penerapan Transformer untuk mendeteksi penyakit pada tanaman menggunakan data hiperspektral sangat menantang.
Dan tantangan tersebut akan kami coba selesaikan di dalam penelitian ini.

== Permasalahan yang akan diteliti

Dalam penelitian ini beberapa permasalahan yang akan kami teliti antara lain:
+ Bagaimana cara untuk mendesain Transformer-based model yang sesuai untuk menyelesaikan problem pendeteksian dini penyakit pada tanaman?
+ Bagaimana cara untuk memanfatkan pretrained ViT -Transformer agar bisa digunakan untuk data yang berbentuk sinyal?
+ Bagaimana cara meningkatkan performa dari pendeteksian dini penyakit pada tanaman?

== Tujuan Khusus

Adapun tujuan khusus dari penelitian ini adalah untuk mendesain suatu model baru berbasis Transformer yang sesuai untuk data hiperspektral dan dapat digunakan untuk pendeteksian dini penyakit pada tanaman yang jumlah datanya sangat terbatas dengan akurasi yang tinggi.

== Urgensi Penelitian

Penelitian ini sangat penting untuk dilakukan kalua dilihat dari sisi ilmu pengetahuan dan aplikasi.
- Dari sisi ilmu pengetahuan: penelitian ini sangat penting untuk menemukan model baru berbasis Transformer tetapi digunakan untuk data yang berupa sinyal hyperspectral dan jumlahnya terbatas.
- Dari sisi aplikasi: hasil penelitian ini bisa dimanfaatkan untuk mendeteksi dini penyakit pada tanaman sehingga memudahkan proses pencegahan terjadinya gagal panen.
