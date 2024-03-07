#import "/research/globals.typ": *

= TINJAUAN PUSTAKA

Secara umum, peta jalan bidang yang diteliti bisa dilihat pada @img-prev-works.
Penelitian tentang pendekteksian dini penyakit pada tanaman diawali dengan adanya beberapa penelitian sebelumnya yang sudah mengeksplorasi korelasi antara sinyal spectral dengan ciri-ciri physiology pada tanaman yang meliputi konsentrasi ion, kandungan air, kandungan klorofil, biomas, dan konduktansi stomata menggunakan Partial Least Square Regression (PLSR).
Berbagai macam Spectral Vegetation Indexes (SVIs) yang spesifik terhadap jenis tanaman dan jenis penyakit sudah diinvestigasi.
Penelitian-penelitian tersebut menemukan adanya korelasi yang kuat antara ciri-ciri physiologi pada tanaman dan sinyal spectral pada rentang 530 nm-550 nm untuk mendeteksi stress pada tanaman yang disebabkan karena kekurangan air pada tanaman anggur @rapaport2015, pada rentang 600 nm-730 nm untuk mendeteksi stress karena kelebihan kandungan garam pada tanaman kedelai @iliev2009, dan rentang 531 nm-571 nm untuk mendeteksi adanya mosaic virus pada tanaman ubi @raji2015.

// Figure
#fig-img(
  image("res/prev-works.png"),
  caption: [Penelitian-penelitian sebelumnya.],
) <img-prev-works>

Karena penggunaan SVIs sifatnya khusus tergantung pada jenis tanaman dan jenis penyakit sehingga sulit untuk digeneralisasi, beberapa peneliti memilih menggukan metode pemilihan fitur untuk memilih beberapa fitur yang penting dari sinyal hiperspektral dari pada menggunakan SVIs.
#i[@moghimi2018] menggunakan ensamble feature selection untuk memilih 15 band yang paling penting dari 215 band yang tersedia yang selanjutnya band-band terpilih tadi diproses menggunakan quadratic discriminant analysis (QDA) untuk mendeteksi stress karena kelebihan garam pada tanaman.
Penelitian lainnya menggunakan PCA untuk mengurangi dimensi hyperspectral dari 2500 menjadi 30 dan kemudian menggunakan support vector machine (SVM).

Alih-alih menggunakan metode pemilihan fitur, beberapa penelitian terkini cenderung untuk memanfaatkan semua band dalam data hiperspektral dan kemudian menggunakan tehnik deep learning yang berbasis pada operasi konvolusi untuk mendeteksi penyakit pada tanaman.
Penelitian yang dilakukan oleh #i[@owomugisha2021] menggunakan one-dimensional convolutional neural network (1D CNN) untuk mendeteksi penyakit yang disebabkan oleh virus pada tanaman ubi jalar.
Karena 1D-CNN lemah dalam mengekstraksi fitur global, #i[@jin2018] mengusulkan untuk mengkonversi data sinyal hiperspektral ke dalam bentuk 2 dimensi dan kemudian menggunakan two-dimentioanal convolutional neural network (2D-CNN) untuk deteksi penyakit head blight pada tanaman gandum.
2D-CNN tersebut memang lebih bagus dari pada 1D-CNN, namun perubahan dimensi dari 1D ke 2D pada data hiperspektral memungkinkan adanya informasi yang hilang.

Oleh karena itu, #i[@khotimah2022] mengusulkan suatu metode deep learning bernama SC-CAN yang menggunakan konvolusi 1 dimensi yang bisa mengekstraksi fitur local dan fitur global dengan cara menambahkan operasi dilasi pada proses konvolusi dan menambahkan modul channel attention untuk membuat model tersebut fokus pada informasi-informasi yang penting.
Namun demikian, ternyata operasi dilasi pada proses konvolusi bisa mengakibatkan hilangnya informasi ketetanggaan jika rasio dilasinya terlalu tinggi.
Selain itu layer konvolusinya juga mempunyai receptive field yang sudah fix yang tergantung pada rasio dilasi, sehingga mengurangi kemampuannya dalam mengekstraksi fitur global.

Sementara itu, #i[@vaswani2017] mengusulkan suatu arsitektur deep learning yang tidak mengandung layer konvolusi sama sekali yang di sebut dengan Transformer untuk mengekstraksi fitur global dari suatu data.
Transformer yang dilengkapi dengan mekanisme self-attention dapat mengekstraksi hubungan antar elemen dalam suatu input, sehingga sangat cocok digunakan untuk mengekstraksi fitur global.
Model tersebut kemudian digunakan untuk menyelesaikan masalah di bidang NLP seperti: peringkasan dokumen, klasifikasi dokumen, translasi dokumen.
Hasil eksperimennya menunjukkan bahwa model yang ia usulkan sangat menjanjikan.
Keberhasilan Transformer dalam menyelesaikan problem di bidang NLP, menginspirasi banyak peneliti untuk mengadopsinya untuk menyelesaikan problem-problem pada domain yang lain, seperti pada visi @khan2022.

Namun, karena Transformer merupakan suatu model yang membutuhkan data training yang besar mencapai jutaan data, tidak semua masalah bisa diselesaikan dengan Transformer secara langsung.
Contohnya dalam aplikasi pendeteksian dini penyakit pada tanaman, data hiperspektral yang tersedia sangat terbatas.
Sehingga pada penelitian kami sebelumnya, kami mengusulkan penggunaan modul spectral-to-token (S2T) dan multiscale conformer encoder (MCE) yang membuat Transformer mampu mengekstraksi fitur-fitur pada data hiperspektral walaupun jumlah data latih yang tersedia terbatas @khotimah2023.
Model tersebut kemudian disebut dengan MCE-ST.

Walaupun MCE-ST lebih bagus dibandingakan dengan metode-metode deep learning berbasis konvolusi dan merupakan state of the art, namun akurasinya masih perlu ditingkatkan sehingga bisa diterapkan di dunia nyata.
Terinspirasi dari kesuksesan penggunaan Transformer pada aplikasi visi komputer, dalam penelitian ini kami mengusulkan untuk menggunakan pretrained ViT (Transformer yang sudah di-pretrain menggunakan data gambar) untuk menyelesaikan problem deteksi dini penyakit pada tanaman menggunakan data hiperspektral.
Karena data hiperspektral strukturnya 1 dimensi maka kami akan mendesain suatu modul tambahan agar input yang kami miliki sesuai untuk ViT.
Dan juga kami akan mengeksplor proses fine-tuning, sehingga deteksi penyakit dini pada tanaman menggunakan data hiperspektral mampu menghasilkan performa yang maksimal.
