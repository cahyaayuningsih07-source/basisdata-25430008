# Dokumen Kebutuhan Data Kopma

**Nama:** Cahya Ayuningsih  
**NIM:** 25430008  
**Mata Kuliah:** Basis Data  
**Modul:** 2 — Analisis Kebutuhan Data

---

## 1. Deskripsi Studi Kasus

Koperasi Mahasiswa (Kopma) merupakan organisasi yang menyediakan berbagai kebutuhan mahasiswa. Kegiatan utama Kopma meliputi pengelolaan anggota, pengelolaan barang, pengadaan barang dari pemasok, dan transaksi penjualan.

Analisis kebutuhan data dilakukan untuk menentukan data yang perlu disimpan, proses bisnis yang menggunakan data tersebut, aturan bisnis, kebutuhan informasi, dan kebutuhan non-fungsional sistem.

---

## 2. Identifikasi Aktor dan Proses Bisnis

| ID | Proses Bisnis | Aktor | Deskripsi |
|---|---|---|---|
| PB-01 | Pendaftaran Anggota | Petugas | Mencatat mahasiswa yang mendaftar menjadi anggota Kopma. |
| PB-02 | Pengelolaan Barang | Petugas | Menambah, mengubah, dan mengelola data barang yang dijual. |
| PB-03 | Pengadaan Barang | Petugas | Mencatat pemasok dan barang yang diperoleh dari pemasok. |
| PB-04 | Penjualan Barang | Kasir | Mencatat transaksi penjualan barang kepada anggota atau pelanggan. |
| PB-05 | Pembayaran | Kasir | Mencatat pembayaran atas transaksi penjualan. |

---

## 3. Pembedahan Nota Penjualan

### 3.1 Data yang Disimpan

Data yang perlu disimpan dari nota penjualan meliputi:

- nomor nota
- tanggal transaksi
- identitas anggota
- kode barang
- nama barang
- harga barang saat transaksi
- jumlah barang
- metode pembayaran

Harga pada saat transaksi perlu disimpan karena harga barang dapat berubah. Dengan demikian, transaksi lama tetap dapat menunjukkan harga yang benar pada saat transaksi dilakukan.

### 3.2 Nilai Turunan

Beberapa nilai dapat diperoleh melalui perhitungan:

- **Subtotal = harga saat transaksi × jumlah**
- **Total = jumlah seluruh subtotal**

Nilai turunan tidak harus disimpan apabila dapat dihitung kembali dari data transaksi.

---

## 4. Entitas Kandidat dan Aturan Bisnis

### 4.1 Entitas Kandidat

| ID | Entitas | Keterangan |
|---|---|---|
| E-01 | Anggota | Data mahasiswa yang menjadi anggota Kopma. |
| E-02 | Barang | Data barang yang dijual Kopma. |
| E-03 | Pemasok | Data pihak yang memasok barang. |
| E-04 | Transaksi | Data transaksi penjualan. |
| E-05 | Detail Transaksi | Data barang yang terdapat dalam transaksi. |
| E-06 | Pembayaran | Data pembayaran transaksi. |

### 4.2 Aturan Bisnis

| ID | Aturan Bisnis |
|---|---|
| AB-01 | Setiap anggota memiliki identitas anggota yang unik. |
| AB-02 | Setiap barang memiliki kode barang yang unik. |
| AB-03 | Satu transaksi dapat memiliki satu atau lebih barang. |
| AB-04 | Setiap detail transaksi mengacu pada satu barang. |
| AB-05 | Jumlah barang dalam transaksi harus lebih besar dari 0. |
| AB-06 | Setiap transaksi penjualan harus memiliki pembayaran. |

---

## 5. Kebutuhan Informasi dan Matriks CRUD

### 5.1 Kebutuhan Informasi

| ID | Kebutuhan Informasi |
|---|---|
| KI-01 | Sistem dapat menampilkan data anggota Kopma. |
| KI-02 | Sistem dapat menampilkan data barang beserta harga dan stok. |
| KI-03 | Sistem dapat menampilkan riwayat transaksi penjualan. |
| KI-04 | Sistem dapat menampilkan informasi pembayaran dan transaksi. |

### 5.2 Matriks CRUD

| Proses | Anggota | Barang | Pemasok | Transaksi | Detail Transaksi | Pembayaran |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| PB-01 Pendaftaran Anggota | C | | | | | |
| PB-02 Pengelolaan Barang | | CUD | | | | |
| PB-03 Pengadaan Barang | | U | C | | | |
| PB-04 Penjualan Barang | R | R | | C | C | |
| PB-05 Pembayaran | | | | R | R | C |

**Keterangan:**

- C = Create
- R = Read
- U = Update
- D = Delete

---

## 6. Kamus Data Awal

| No | Elemen Data | Entitas | Keterangan | Penanggung Jawab |
|---:|---|---|---|---|
| 1 | id_anggota | Anggota | Identitas unik anggota | Petugas |
| 2 | nama_anggota | Anggota | Nama anggota | Petugas |
| 3 | nim | Anggota | Nomor induk mahasiswa | Petugas |
| 4 | status_anggota | Anggota | Status aktif anggota | Petugas |
| 5 | kode_barang | Barang | Kode unik barang | Petugas |
| 6 | nama_barang | Barang | Nama barang | Petugas |
| 7 | harga_barang | Barang | Harga barang | Petugas |
| 8 | stok | Barang | Jumlah stok barang | Petugas |
| 9 | id_pemasok | Pemasok | Identitas pemasok | Petugas |
| 10 | nama_pemasok | Pemasok | Nama pemasok | Petugas |
| 11 | no_nota | Transaksi | Nomor transaksi | Kasir |
| 12 | tanggal_transaksi | Transaksi | Tanggal transaksi | Kasir |
| 13 | id_anggota | Transaksi | Anggota yang melakukan transaksi | Kasir |
| 14 | kode_barang | Detail Transaksi | Barang yang dibeli | Kasir |
| 15 | harga_saat_transaksi | Detail Transaksi | Harga ketika transaksi terjadi | Kasir |
| 16 | jumlah | Detail Transaksi | Jumlah barang yang dibeli | Kasir |
| 17 | id_pembayaran | Pembayaran | Identitas pembayaran | Kasir |
| 18 | jumlah_bayar | Pembayaran | Nominal pembayaran | Kasir |
| 19 | metode_bayar | Pembayaran | Metode pembayaran | Kasir |
| 20 | tanggal_bayar | Pembayaran | Tanggal pembayaran | Kasir |

### 6.1 Kebutuhan Non-Fungsional

1. Data anggota harus dilindungi dari akses pengguna yang tidak berwenang.
2. Data transaksi harus tersimpan secara konsisten.
3. Sistem harus dapat melakukan pencarian barang berdasarkan kode atau nama.
4. Perubahan stok harus dapat ditelusuri berdasarkan transaksi.
5. Data transaksi lama harus tetap dapat menampilkan harga pada saat transaksi dilakukan.

---

## 7. Titik Analisis

### TA 1 — Harga pada Nota

Harga tetap disimpan pada saat transaksi walaupun harga barang juga terdapat pada data barang karena harga barang dapat berubah. Jika harga barang berubah pada bulan berikutnya, transaksi lama harus tetap menunjukkan harga yang berlaku ketika transaksi tersebut dilakukan.

Hal tersebut juga berkaitan dengan keluhan ketua. Jika sistem hanya mengambil harga terbaru dari tabel barang, nota transaksi lama dapat menunjukkan nilai yang berbeda dari nilai sebenarnya ketika transaksi dilakukan.

### TA 2 — Subtotal dan Total

Salah satu alasan subtotal dan total tidak perlu disimpan adalah karena keduanya dapat dihitung dari harga dan jumlah barang. Menyimpan nilai yang sebenarnya dapat dihitung kembali dapat menyebabkan duplikasi data dan risiko ketidaksesuaian.

Namun, total dapat tetap disimpan apabila diperlukan sebagai nilai resmi transaksi atau untuk kebutuhan audit. Jika disimpan, sistem harus memastikan total tersebut konsisten dengan detail transaksi.

### TA 3 — Pemasok Tidak Memiliki C

Jika kolom Pemasok tidak memiliki huruf **C**, berarti belum terdapat proses yang membuat data pemasok.

Proses yang perlu ditambahkan adalah **pendaftaran atau pengelolaan pemasok**, sehingga terdapat proses yang melakukan Create terhadap entitas Pemasok.

Status aktif anggota dapat diubah oleh **petugas yang bertanggung jawab atas pengelolaan data anggota**.

---

## 8. Latihan — Poin Loyalitas

Ketentuan poin loyalitas:

- Setiap kelipatan Rp10.000 belanja mendapatkan 1 poin.
- Setiap 50 poin dapat ditukar dengan potongan Rp5.000.

### 8.1 Elemen Data Tambahan

| Elemen | Entitas | Keterangan |
|---|---|---|
| poin_loyalitas | Anggota | Jumlah poin yang dimiliki anggota |
| poin_diperoleh | Transaksi | Poin yang diperoleh dari transaksi |
| poin_digunakan | Transaksi | Poin yang digunakan |
| nilai_diskon | Transaksi | Nilai potongan yang diperoleh |

### 8.2 Aturan Bisnis Tambahan

| ID | Aturan Bisnis |
|---|---|
| AB-07 | Setiap kelipatan Rp10.000 dari nilai belanja menghasilkan 1 poin. |
| AB-08 | Anggota yang memiliki minimal 50 poin dapat menukar poin dengan potongan Rp5.000. |
| AB-09 | Poin yang digunakan untuk penukaran harus dikurangi dari saldo poin anggota. |
| AB-10 | Poin yang diperoleh dari transaksi dicatat setelah transaksi berhasil. |

### 8.3 Kebutuhan Informasi Tambahan

| ID | Kebutuhan Informasi |
|---|---|
| KI-05 | Sistem dapat menampilkan jumlah poin anggota. |
| KI-06 | Sistem dapat menghitung poin berdasarkan nilai transaksi. |
| KI-07 | Sistem dapat mencatat penukaran poin menjadi potongan. |

---

## 9. Pernyataan Kabur yang Diperbaiki

### A. "Data anggota harus aman."

Data NIM, nama, nomor telepon, dan status anggota hanya dapat dilihat atau diubah oleh petugas yang memiliki hak akses pengelolaan anggota.

### B. "Sistem harus cepat mencari barang."

Pencarian barang berdasarkan kode barang atau nama barang harus menampilkan hasil maksimal dalam waktu **3 detik** pada kondisi penggunaan normal.

### C. "Laporan stok harus akurat."

Jumlah stok pada laporan harus sesuai dengan data stok barang dan setiap perubahan stok harus dapat ditelusuri melalui transaksi pengadaan atau penjualan.

---

## 10. Kesimpulan

Analisis kebutuhan data Kopma menghasilkan identifikasi proses bisnis, aktor, dokumen sumber, entitas kandidat, aturan bisnis, kebutuhan informasi, matriks CRUD, dan kamus data.

Analisis juga menunjukkan bahwa data transaksi harus mempertahankan harga pada saat transaksi agar riwayat transaksi tetap benar walaupun harga barang berubah. Selain itu, penambahan fitur poin loyalitas membutuhkan elemen data, aturan bisnis, dan kebutuhan informasi tambahan.

Dokumen ini menjadi dasar untuk tahap perancangan basis data pada modul berikutnya.
