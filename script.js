function showSection(sectionId) {
    const sections = document.querySelectorAll('.section');
    sections.forEach(section => {
        section.classList.remove('active');
    });

    const activeSection = document.getElementById(sectionId);
    if (activeSection) {
        activeSection.classList.add('active');
    }
}

document.getElementById('kayitForm').addEventListener('submit', function(event) {
    event.preventDefault();
    // Kayıt işlemleri burada yapılacak
    alert('Kayıt formu gönderildi!');
});

document.getElementById('veriGoruntulemeForm').addEventListener('submit', function(event) {
    event.preventDefault();
    // Veri görüntüleme işlemleri burada yapılacak
    alert('Veri görüntüleme formu gönderildi!');
});

document.getElementById('komiteKayitForm').addEventListener('submit', function(event) {
    event.preventDefault();
    // Komite kaydı işlemleri burada yapılacak
    alert('Komite kaydı formu gönderildi!');
});

document.getElementById('komiteGirisForm').addEventListener('submit', function(event) {
    event.preventDefault();
    // Komite girişi işlemleri burada yapılacak
    alert('Komite giriş formu gönderildi!');
});
