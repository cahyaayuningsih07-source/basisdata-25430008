-- P01: Lingkungan Kerja MariaDB
-- NIM: 25430008
-- Password sengaja disamarkan untuk keamanan.

-- Pemeriksaan server
SELECT VERSION(), CURRENT_USER();
SHOW DATABASES;
SELECT @@sql_mode;

-- Pemeriksaan akun root
SELECT User, Host
FROM mysql.user
WHERE User = 'root';

-- Membuat database
CREATE DATABASE kopma_008
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Membuat akun kerja
-- Password asli tidak ditulis di repositori.
CREATE USER 'mhs_008'@'localhost'
IDENTIFIED BY '<PASSWORD_KERJA>';

-- Memberikan hak akses ke database
GRANT ALL PRIVILEGES ON kopma_008.* TO 'mhs_008'@'localhost';

-- Memeriksa hak akses
SHOW GRANTS FOR 'mhs_008'@'localhost';

-- Memilih database kerja
USE kopma_008;

-- Pengujian database
SHOW DATABASES;

-- Pengujian pembatasan akses:
-- Sebagai mhs_008, perintah berikut menghasilkan ERROR 1044:
-- USE mysql;