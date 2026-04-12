CREATE TABLE pelanggan (
    id VARCHAR(5) PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    alamat VARCHAR(100),
    umur INT NOT NULL,
    saldo DECIMAL(10,2) NOT NULL,
    tanggal_bergabung DATE NOT NULL
);

DESC pelanggan;

CREATE TABLE transaksi (
    id VARCHAR(10) PRIMARY KEY,
    total_pembelian DECIMAL(12,2) NOT NULL,
    waktu_transaksi TIMESTAMP NOT NULL
);
 
DESC transaksi;

INSERT INTO pelanggan (id, nama, alamat, umur, saldo, tanggal_bergabung) VALUES
('RE001', 'Ada Wong', 'Ennerdale Street, Terragrigia', 30, 85000000.00, '2021-03-17'),
('RE002', 'Leon Scott Kennedy', 'Washington D.C.', 50, 45000.00, '2023-01-30'),
('RE003', 'Grace Ashcroft', 'Old Oak Shopping Center, London', 30, 90000.00, '2022-06-15'),
('RE004', 'Chris Redfield', 'Boston, Massachusetts', 50, 7250000.00, '2020-07-23'),
('RE005', 'Claire Redfield', 'New York, New York', 50, 5930000.00, '2024-12-24'),
('RE006', 'Albert Wesker', 'Umbrella Research Facility, Europe', 50, 99999999.99, '2025-05-10'),
('RE007', 'Jill Valentine', 'Arklay Mountains, Raccoon City', 40, 1500000.00, '2021-08-15'),
('RE008', 'Burton', 'Floating Island, Sheena Island', 50, 2000000.00, '2023-09-20'),
('RE009', 'Rebecca Chambers', 'Raccoon City Police Department', 40, 800000.00, '2020-07-24'),
('RE010', 'Alomar', 'West African Village', 40, 1200000.00, '2026-03-05');

SELECT * FROM pelanggan;

INSERT INTO transaksi (id, total_pembelian, waktu_transaksi) VALUES
('TX001', 1500000.00, '2026-04-01 10:30:00'),
('TX002', 75000.00, '2026-04-02 14:22:00'),
('TX003', 2500000.00, '2026-04-03 09:15:00'),
('TX004', 89000.00, '2026-04-04 16:45:00'),
('TX005', 3200000.00, '2026-04-05 11:30:00'),
('TX006', 1200000.00, '2026-04-06 13:05:00'),
('TX007', 500000.00, '2026-04-07 08:50:00'),
('TX008', 4100000.00, '2026-04-08 19:20:00'),
('TX009', 950000.00, '2026-04-09 12:10:00'),
('TX010', 675000.00, '2026-04-10 17:45:00');

SELECT * FROM transaksi;

SELECT COUNT(*) AS jumlah_pelanggan_gabung_setelah_2022 FROM pelanggan WHERE YEAR(tanggal_bergabung) > 2022;
SELECT COUNT(*) AS jumlah_transaksi_diatas_1jt FROM transaksi WHERE total_pembelian > 1000000;

SELECT SUM(saldo) AS total_saldo_pelanggan_lama FROM pelanggan WHERE YEAR(tanggal_bergabung) < 2022;
SELECT SUM(total_pembelian) AS total_pembelian_april_2026 FROM transaksi WHERE YEAR(waktu_transaksi) = 2026 AND MONTH(waktu_transaksi) = 4;

SELECT AVG(umur) AS rata_umur_pelanggan_saldo_rendah FROM pelanggan WHERE saldo < 1000000;
SELECT AVG(total_pembelian) AS rata_pembelian_april_2026 FROM transaksi WHERE YEAR(waktu_transaksi) = 2026 AND MONTH(waktu_transaksi) = 4;

SELECT MIN(saldo) AS saldo_terendah, MAX(saldo) AS saldo_tertinggi FROM pelanggan WHERE tanggal_bergabung > '2021-12-31';
SELECT MIN(total_pembelian) AS min_pembelian_april_2026, MAX(total_pembelian) AS max_pembelian_april_2026 FROM transaksi WHERE YEAR(waktu_transaksi) = 2026 AND MONTH(waktu_transaksi) = 4;

SELECT YEAR(tanggal_bergabung) AS tahun_gabung, COUNT(*) AS jumlah_pelanggan FROM pelanggan GROUP BY YEAR(tanggal_bergabung) HAVING COUNT(*) > 1;
SELECT umur, COUNT(*) AS jumlah_pelanggan FROM pelanggan GROUP BY umur HAVING COUNT(*) > 1;

SELECT id, nama, saldo,
CASE
    WHEN saldo > 50000000 THEN 'High'
    WHEN saldo >= 1000000 THEN 'Medium'
    ELSE 'Low'
END AS kategori_saldo
FROM pelanggan;
