CREATE DATABASE ekolojik_kredi;

USE ekolojik_kredi;

-- Öğrenciler tablosu
CREATE TABLE ogrenciler (
    ogrenci_id INT AUTO_INCREMENT PRIMARY KEY,
    isim VARCHAR(100),
    email VARCHAR(100),
    okul VARCHAR(100),
    okul_numarasi VARCHAR(50),
    sifre VARCHAR(100)
);

-- Atıklar tablosu
CREATE TABLE atiklar (
    atik_id INT AUTO_INCREMENT PRIMARY KEY,
    ogrenci_id INT,
    atik_turu VARCHAR(50),
    atik_kutlesi FLOAT,
    teslim_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    hatali_ayrisim BOOLEAN,
    FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(ogrenci_id)
);

-- Ekolojik Kredi tablosu
CREATE TABLE ekolojik_kredi (
    kredi_id INT AUTO_INCREMENT PRIMARY KEY,
    ogrenci_id INT,
    toplam_kredi FLOAT DEFAULT 0,
    FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(ogrenci_id)
);

-- Trigger: Atık eklendiğinde ekolojik kredi güncelleme
DELIMITER //
CREATE TRIGGER kredi_guncelle AFTER INSERT ON atiklar
FOR EACH ROW
BEGIN
    DECLARE yeni_kredi FLOAT;
    SET yeni_kredi = NEW.atik_kutlesi * 10; -- Atık kütlesine göre kredi hesaplama (örnek)
    UPDATE ekolojik_kredi
    SET toplam_kredi = toplam_kredi + yeni_kredi
    WHERE ogrenci_id = NEW.ogrenci_id;
END; //
DELIMITER ;
