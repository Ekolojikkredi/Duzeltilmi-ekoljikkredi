<?php
$servername = "localhost";
$username = "kullanici_adi";
$password = "sifre";
$dbname = "ekolojik_kredi";

// Bağlantıyı oluştur
$conn = new mysqli($servername, $username, $password, $dbname);

// Bağlantıyı kontrol et
if ($conn->connect_error) {
    die("Bağlantı hatası: " . $conn->connect_error);
}

// Form verilerini al
$isim = $_POST['isim'];
$email = $_POST['email'];
$okul = $_POST['okul'];
$okul_numarasi = $_POST['okulNumarasi'];
$sifre = $_POST['sifre'];

// Verileri kaydet
$sql = "INSERT INTO ogrenciler (isim, email, okul, okul_numarasi, sifre)
VALUES ('$isim', '$email', '$okul', '$okul_numarasi', '$sifre')";

if ($conn->query($sql) === TRUE) {
    echo "Kayıt başarılı!";
} else {
    echo "Hata: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
