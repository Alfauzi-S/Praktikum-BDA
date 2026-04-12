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
('RE001', 'Ada Wong', 'Ennerdale Street, Terragrigia', 32, 85000000.00, '2021-03-17'),
('RE002', 'Leon Scott Kennedy', 'Washington D.C.', 49, 45000.00, '2023-01-30'),
('RE003', 'Grace Ashcroft', 'Old Oak Shopping Center, London', 28, 90000.00, '2022-06-15'),
('RE004', 'Chris Redfield', 'Boston, Massachusetts', 52, 7250000.00, '2020-07-23'),
('RE005', 'Claire Redfield', 'New York, New York', 47, 5930000.00, '2024-12-24'),
('RE006', 'Albert Wesker', 'Umbrella Research Facility, Europe', 48, 99999999.99, '2025-05-10'),
('RE007', 'Jill Valentine', 'Arklay Mountains, Raccoon City', 46, 1500000.00, '2021-08-15'),
('RE008', 'Burton', 'Floating Island, Sheena Island', 55, 2000000.00, '2023-09-20'),
('RE009', 'Rebecca Chambers', 'Raccoon City Police Department', 41, 800000.00, '2020-07-24'),
('RE010', 'Alomar', 'West African Village', 38, 1200000.00, '2026-03-05');

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

SELECT id, nama, umur, saldo FROM pelanggan WHERE umur IN (SELECT umur from pelanggan WHERE umur > 45);
SELECT * FROM transaksi WHERE total_pembelian IN (SELECT total_pembelian from transaksi WHERE total_pembelian > 1500000.00);

SELECT id, nama, saldo FROM pelanggan WHERE saldo <= 500000.00 ORDER BY saldo ASC;

SELECT id, nama, tanggal_bergabung FROM pelanggan WHERE tanggal_bergabung > '2021-12-31' ORDER BY tanggal_bergabung ASC;

SELECT id, nama, saldo, tanggal_bergabung FROM pelanggan WHERE saldo > ANY (SELECT saldo FROM pelanggan WHERE tanggal_bergabung < '2021-01-01');

SELECT id, nama, umur, saldo, 'Saldo < 1jt' as kategori FROM pelanggan WHERE saldo < 1000000.00 UNION SELECT id, nama, umur, saldo, 'Saldo > 10jt' FROM pelanggan WHERE saldo > 10000000.00 ORDER BY nama ASC;

SELECT id, nama FROM pelanggan WHERE nama LIKE '______';

SELECT id, nama FROM pelanggan WHERE nama LIKE 'A%';

SELECT id, nama FROM pelanggan WHERE nama LIKE '%t%';

SELECT id, nama FROM pelanggan WHERE nama LIKE '%d';
