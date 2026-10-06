# Dokumen Kebutuhan Data
## Proyek Basis Data — NIM 25430008

**Nama:** Cahya Ayuningsih  
**NIM:** 25430008  
**Mata Kuliah:** Basis Data  
**Modul:** 2 — Analisis Kebutuhan Data

---

## 1. Deskripsi Organisasi

Organisasi fiktif pada proyek ini adalah **Koperasi Mahasiswa Cahya Sejahtera (Kopma Cahya Sejahtera)**. Organisasi ini melayani penjualan kebutuhan mahasiswa seperti alat tulis, makanan ringan, minuman, dan perlengkapan perkuliahan.

Sistem basis data digunakan untuk mengelola data anggota, barang, pemasok, transaksi penjualan, detail transaksi, dan pembayaran.

---

## 2. Proses Bisnis

| ID | Proses Bisnis | Deskripsi |
|---|---|---|
| PB-01 | Pendaftaran Anggota | Petugas mencatat data mahasiswa yang mendaftar sebagai anggota koperasi. |
| PB-02 | Pengelolaan Barang | Petugas mencatat dan memperbarui data barang yang dijual. |
| PB-03 | Pengadaan Barang | Petugas mencatat pemasok dan barang yang diterima dari pemasok. |
| PB-04 | Penjualan Barang | Petugas mencatat transaksi penjualan barang kepada anggota atau pelanggan. |
| PB-05 | Pembayaran Transaksi | Petugas mencatat pembayaran atas transaksi penjualan. |

---

## 3. Dokumen Sumber dan Pembedahan

### 3.1 Dokumen Sumber: Nota Penjualan

Contoh nota penjualan:

| Elemen | Contoh |
|---|---|
| No. Nota | NT-0001 |
| Tanggal | 06-10-2026 |
| ID Anggota | AG-001 |
| Nama Anggota | Cahya |
| Kode Barang | BRG-001 |
| Nama Barang | Buku Tulis |
| Harga Saat Transaksi | Rp10.000 |
| Jumlah | 2 |
| Subtotal | Rp20.000 |
| Total | Rp20.000 |
| Pembayaran | Rp20.000 |

### 3.2 Elemen yang Disimpan

Elemen yang perlu disimpan antara lain nomor nota, tanggal transaksi, ID anggota, kode barang, harga saat transaksi, dan jumlah barang.

### 3.3 Nilai Turunan

Subtotal dapat dihitung dari:

`harga saat transaksi × jumlah`

Total dapat dihitung dari seluruh subtotal dalam satu transaksi.

Harga saat transaksi tetap disimpan agar nota lama tetap menunjukkan harga yang benar ketika harga barang berubah di kemudian hari.

---

## 4. Entitas Kandidat

| ID | Entitas | Keterangan |
|---|---|---|
| E-01 | Anggota | Menyimpan data anggota koperasi. |
| E-02 | Barang | Menyimpan data barang yang dijual. |
| E-03 | Pemasok | Menyimpan data pemasok barang. |
| E-04 | Transaksi | Menyimpan data transaksi penjualan. |
| E-05 | Detail Transaksi | Menyimpan barang dan jumlah dalam setiap transaksi. |
| E-06 | Pembayaran | Menyimpan data pembayaran transaksi. |

---

## 5. Aturan Bisnis

| ID | Aturan Bisnis |
|---|---|
| AB-01 | Setiap anggota memiliki ID anggota yang unik. |
| AB-02 | Setiap barang memiliki kode barang yang unik. |
| AB-03 | Satu transaksi dapat memiliki satu atau lebih detail barang. |
| AB-04 | Setiap detail transaksi mengacu pada satu barang. |
| AB-05 | Jumlah barang yang dijual harus lebih dari 0. |
| AB-06 | Setiap transaksi memiliki pembayaran. |
| AB-07 | Setiap kelipatan Rp10.000 belanja menghasilkan 1 poin loyalitas. |
| AB-08 | Sebanyak 50 poin dapat ditukar dengan potongan Rp5.000. |

---

## 6. Kebutuhan Informasi

| ID | Kebutuhan Informasi |
|---|---|
| KI-01 | Sistem dapat menampilkan data anggota dan status keanggotaannya. |
| KI-02 | Sistem dapat menampilkan daftar barang beserta stok dan harga. |
| KI-03 | Sistem dapat menampilkan riwayat transaksi penjualan. |
| KI-04 | Sistem dapat menampilkan informasi pembayaran dan total transaksi. |
| KI-05 | Sistem dapat menampilkan jumlah poin loyalitas setiap anggota. |

---

## 7. Matriks CRUD

| Proses | Anggota | Barang | Pemasok | Transaksi | Detail Transaksi | Pembayaran |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| PB-01 Pendaftaran Anggota | C |  |  |  |  |  |
| PB-02 Pengelolaan Barang |  | CUD |  |  |  |  |
| PB-03 Pengadaan Barang |  | U | C |  |  |  |
| PB-04 Penjualan Barang | R | R |  | C | C |  |
| PB-05 Pembayaran Transaksi |  |  |  | R | R | C |
| Poin Loyalitas | U |  |  | R | R | U |

Keterangan:

- **C** = Create
- **R** = Read
- **U** = Update
- **D** = Delete

---

## 8. Kamus Data

| No | Elemen Data | Entitas | Tipe/Keterangan | Penanggung Jawab |
|---:|---|---|---|---|
| 1 | id_anggota | Anggota | Kode unik anggota | Petugas |
| 2 | nama_anggota | Anggota | Nama anggota | Petugas |
| 3 | nim | Anggota | Nomor induk mahasiswa | Petugas |
| 4 | no_hp | Anggota | Nomor telepon | Petugas |
| 5 | status_anggota | Anggota | Aktif/tidak aktif | Petugas |
| 6 | poin | Anggota | Jumlah poin loyalitas | Petugas |
| 7 | kode_barang | Barang | Kode unik barang | Petugas |
| 8 | nama_barang | Barang | Nama barang | Petugas |
| 9 | harga_barang | Barang | Harga barang | Petugas |
| 10 | stok | Barang | Jumlah stok | Petugas |
| 11 | id_pemasok | Pemasok | Kode unik pemasok | Petugas |
| 12 | nama_pemasok | Pemasok | Nama pemasok | Petugas |
| 13 | no_nota | Transaksi | Nomor transaksi | Kasir |
| 14 | tanggal_transaksi | Transaksi | Tanggal transaksi | Kasir |
| 15 | id_anggota_transaksi | Transaksi | ID anggota pembeli | Kasir |
| 16 | kode_barang_detail | Detail Transaksi | Kode barang | Kasir |
| 17 | harga_saat_transaksi | Detail Transaksi | Harga ketika transaksi | Kasir |
| 18 | jumlah | Detail Transaksi | Jumlah barang | Kasir |
| 19 | id_pembayaran | Pembayaran | Kode pembayaran | Kasir |
| 20 | jumlah_bayar | Pembayaran | Nominal pembayaran | Kasir |
| 21 | metode_bayar | Pembayaran | Tunai/non-tunai | Kasir |
| 22 | tanggal_bayar | Pembayaran | Tanggal pembayaran | Kasir |

---

## 9. Kebutuhan Non-Fungsional

### 9.1 Keamanan Data

Data pribadi anggota seperti NIM, nama, dan nomor telepon hanya boleh dilihat oleh petugas yang memiliki hak akses.

### 9.2 Perhitungan Parameter P

NIM = **25430008**

Dua digit terakhir = **08**

`P = (08 mod 9) + 1`

`P = 8 + 1`

`P = 9`

Berdasarkan nilai P:

- Maksimal item per transaksi = P + 2 = **11 item**
- Persentase diskon/denda harian = **9%**
- Perkiraan volume transaksi harian = 40 + (5 × P) = **85 transaksi/hari**

### 9.3 Kinerja

Sistem harus mampu mencari data barang berdasarkan kode atau nama dalam waktu maksimal **3 detik** pada kondisi penggunaan normal.

### 9.4 Akurasi

Laporan stok harus menggunakan data stok barang yang tercatat pada sistem dan selisih stok harus dapat ditelusuri melalui transaksi.

### 9.5 Keandalan

Data transaksi yang sudah tersimpan harus tetap tersedia dan tidak berubah tanpa hak akses yang sesuai.

---

## 10. Pernyataan Kabur yang Diperbaiki

### (a) Data anggota harus aman

Data NIM, nama, dan nomor telepon anggota hanya dapat dilihat oleh pengguna dengan hak akses petugas dan tidak dapat diubah oleh pengguna tanpa hak akses.

### (b) Sistem harus cepat mencari barang

Pencarian berdasarkan kode_barang atau nama_barang harus menampilkan hasil maksimal dalam waktu **3 detik** pada kondisi penggunaan normal.

### (c) Laporan stok harus akurat

Jumlah stok pada laporan harus sesuai dengan data stok barang dan setiap perubahan stok harus dapat ditelusuri melalui transaksi pengadaan atau penjualan.

---

## Titik Analisis

### TA 1

Harga tetap disimpan pada detail transaksi karena harga barang dapat berubah. Jika harga barang berubah bulan berikutnya, nota transaksi lama tetap harus menunjukkan harga yang berlaku saat transaksi tersebut terjadi. Hal ini juga membantu menjawab keluhan ketua mengenai ketidaksesuaian nilai transaksi lama ketika harga barang saat ini sudah berubah.

### TA 2

Subtotal dan total dapat dihitung sehingga tidak wajib disimpan untuk menghindari duplikasi data dan risiko ketidaksesuaian nilai. Namun, total dapat tetap disimpan apabila diperlukan sebagai nilai resmi transaksi atau untuk kebutuhan audit, dengan aturan bahwa nilainya harus konsisten dengan detail transaksi.

### TA 3

Jika kolom Pemasok tidak memiliki huruf C, berarti belum ada proses yang membuat atau memasukkan data pemasok. Proses pengelolaan pemasok perlu ditambahkan, misalnya proses pendaftaran pemasok. Status aktif anggota dapat diubah oleh petugas yang bertanggung jawab terhadap pengelolaan anggota.

---

## Kesimpulan

Dokumen ini mendefinisikan kebutuhan data untuk Koperasi Mahasiswa Cahya Sejahtera. Kebutuhan mencakup proses bisnis, entitas, aturan bisnis, kebutuhan informasi, matriks CRUD, kamus data, dokumen sumber, serta kebutuhan non-fungsional.

Nilai parameter personal **P = 9** digunakan untuk menentukan batas transaksi, persentase diskon/denda, dan perkiraan volume transaksi harian.
