-- Nama: Muhammad Alfauzi Syahputra
-- NIM: 2509106006

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
('1', 'Ada Wong', 'Ennerdale Street', 12, 85000000.00, '2004-03-17'),
('2', 'Leon Scott Kennedy', 'Raccoon City Streets', 49, 45000.00, '2004-01-30'),
('3', 'Grace Ashcroft', 'Ennerdale Street', 13, 90000.00, '2016-09-19'),
('4', 'Chris Redfield', 'Victory Lake Road', 52, 7250000.00, '1997-07-23'),
('5', 'Claire Redfield', 'Flower Street', 47, 5930000.00, '2003-12-24');

SELECT * FROM pelanggan;

INSERT INTO transaksi VALUES ('1', 1500000.00, '2026-01-15 10:30:00');
INSERT INTO transaksi VALUES ('2', 75000.00, '2026-01-16 14:22:00');
INSERT INTO transaksi VALUES ('3', 2500000.00, '2026-01-17 09:15:00');
INSERT INTO transaksi VALUES ('4', 89000.00, '2026-01-18 16:45:00');
INSERT INTO transaksi VALUES ('5', 3200000.00, '2026-01-19 11:30:00');

SELECT * FROM transaksi;

UPDATE pelanggan SET alamat = 'Valdelobos', saldo = 190000.00 WHERE umur < 15;

SELECT * FROM pelanggan;

UPDATE pelanggan SET umur = umur + 1;

SELECT * FROM pelanggan;

DELETE FROM transaksi WHERE total_pembelian < 100000;

SELECT * FROM transaksi;

DELETE FROM pelanggan WHERE tanggal_bergabung < '2000-01-01';

SELECT * FROM pelanggan;

SELECT * FROM pelanggan WHERE umur < 15;

SELECT nama, umur, saldo FROM pelanggan;

SELECT * FROM transaksi WHERE total_pembelian > 100000;