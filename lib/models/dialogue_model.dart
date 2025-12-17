class Dialogue{
  final int id;
  final String character;
  final String text;
  final String action;

  const Dialogue({
    required this.character,
    required this.text,
    required this.action,
    required this.id,
  });
}


const List<Dialogue> initialDialogues = [
  Dialogue(id :  0,character: '', text: "'Kerajaan yang kau datangi adalah Suthraku , tempat yang terkenal dengan akademisi dan kekayaannya , namun kenyataan yang kau lihat jauh berbeda. Kau berdiri di Kota Bawah, tempat yang padat, kotor , dan jauh dari gemerlap akademi. Kau memilih untuk singgah di sebuah kedai, Tavert Strauberr-Haus (Rumah Stroberi), jauh dari keramaian utama'", action: ''),
  Dialogue(id :  1,character: 'Nyonya Stroberi', text: "Astaga, seorang petualang! Sudah lama kami tak kedatangan wajah baru di sini. Apa yang membawa Tuan yang gagah berani kemari? Siapa namamu, Nak?", action: ''),
  Dialogue(id :  2,character: 'Nyonya Stroberi', text: "", action: 'input_username'),
  Dialogue(id :  3,character: '[PLAYER_NAME]', text: "namaku [PLAYER_NAME], senang bertemu denganmu nyonya. ", action: ''),
  Dialogue(id :  4,character: 'Nyonya Stroberi', text: "ah nama yang indah. selamat datang di Tavert Strauberr-Haus, [PLAYER_NAME]. ", action: 'navigate_toHome'),
  Dialogue(id :  4,character: 'Loading...', text: " ", action: 'loading'),
  Dialogue(id :  5,character: '[PLAYER_NAME]', text: "nyonya, aku datang ke kerajaan ini sedang mencari saudariku. Kabar terakhir yang kudengar, dia sedang menuntut ilmu di akademi kerajaan ini. Bisakah kau memberitahuku di mana aku bisa menemukannya?", action: ''),
  Dialogue(id :  6,character: 'Nyonya Stroberi', text: "Ah, Nona saudarimu sedang menuntut ilmu di sana, ya? Sayang sekali, Nak, tempat yang kau cari itu berada di Kota Atas. Kau lihat sendiri, kami yang di sini seakan terpisah dari mereka. Tapi aku tak akan mengecewakanmu. Aku punya tugas kecil untukmu. Selesaikan tugas ini selagi kau berkeliling Suthraku, dan aku akan memberimu informasi serta upah yang pantas!", action: ''),
  Dialogue(id :  7,character: '[PLAYER_NAME]', text: "Kota Atas... Pantas saja tempat ini terasa begitu berbeda dari cerita yang kudengar. Baiklah, Nyonya. Jika membersihkan 'sampah' di kota ini adalah harga untuk sebuah informasi, aku terima tawaranmu. Tunggulah di sini, aku akan membereskan mereka lebih cepat dari yang kau kira.", action: 'navigate_toCampaign'),
  Dialogue(id :  8,character: 'Loading...', text: " ", action: ''),
  Dialogue(id :  9,character: '', text: "berhasil mengerjakan tugas, Kau kembali ke Tavert Strauberr-Haus.", action: ''),
  Dialogue(id :  10,character: 'Nyonya Stroberi', text: "Kau kembali, [PLAYER_NAME]! Aku tahu kau akan berhasil. Kota Bawah berhutang budi padamu. Sekarang, katakan apa yang kau inginkan. Apa yang kau temukan tentang Suthraku", action: ''),
  Dialogue(id :  11,character: '[PLAYER_NAME]', text: "Aku sudah melakukan bagianku. Jalanan sudah bersih, dan preman2 itu tak akan mengganggu siapa pun lagi. Tapi, Nyonya ... aku yakin saudariku tidak disini. tidak ditempat kumuh dan barbar ini. Sekarang, tepati janjimu. Bagaimana caranya aku menyeberang ke Kota Atas?", action: ''),
  Dialogue(id :  12,character: 'Nyonya Stroberi', text: "(Menggeleng sambil tersenyum pahit) 'Tidak, Nak. Tidak ada cara bagi kita, 'buah rendahan' Kota Bawah, untuk melewati jembatan itu. Sudah bertahun-tahun jembatan itu tak diturunkan, apalagi sejak munculnya penyakit aneh yang mengubah warga menjadi... monster", action: ''),
  Dialogue(id :  13,character: 'Nyonya Stroberi', text: "Tapi aku bukan penipu. Aku akan memberimu cara, satu-satunya cara. Ada sebuah saluran tua, semacam dungeon, di bawah sungai yang konon tembus langsung ke Kota Atas. Tapi itu adalah neraka. Banyak petualang yang tak pernah kembali.", action: ''),
  Dialogue(id :  14,character: 'Nyonya Stroberi', text: "mereka yang kembali membawa kutukan: tubuh mereka menghijau dipenuhi bunga melati, lalu mereka mati dan bangkit menjadi monster yang menyebarkan penyakit. Warga Kota Atas mungkin tahu, tapi mereka lebih senang melihat kami mati perlahan", action: ''),
  Dialogue(id :  15,character: 'Nyonya Stroberi', text: "Pergilah. Aku sudah membayar utang informasiku. Jika kau berhasil, itu sudah cukup. Namun, jika hatimu tergerak untuk menghentikan kutukan ini, kau dapat kembali. Akan kuberikan imbalan yang setimpal", action: ''),
  Dialogue(id :  16,character: '[PLAYER_NAME]', text: "Kutukan yang mengubah orang menjadi monster melati... Kedengarannya mengerikan. Tapi jika kau pikir cerita hantu itu cukup untuk membuatku mundur, kau salah menilai orang, Nyonya", action: ''),
  Dialogue(id :  17,character: '[PLAYER_NAME]', text: "Jika saluran busuk itu adalah satu-satunya jalan untuk menemui saudariku, maka aku akan menembusnya. terima kasih atas informasinya Nyonya, aku berangkat sekarang.", action: 'navigate_toCampaign'),
  Dialogue(id :  18,character: 'Loading...', text: " ", action: ''),
  Dialogue(id :  19,character: '', text: "Satu bulan telah berlalu. Kau berlatih bersama Melati, menyiapkan perang besar.", action: ''),
  Dialogue(id :  20,character: '', text: "derit pintu berbunyi, kini kau kembali Tavert Strauberr-Haus. nukan untuk meninta upah berlebih, melainkan untuk mencari kekuatan lebih banyak", action: ''),
  Dialogue(id :  21,character: 'Nyonya Stroberi', text: "(Membelalakkan mata saat kau memasuki Tavert Strauberr-Haus) 'To... Tomath?! Aku pikir kau sudah mati! Kau kembali!' ", action: ''),
  Dialogue(id :  22,character: '[PLAYER_NAME]', text: "Aku kembali bukan untuk menagih uang, Nyonya. Aku sudah menyelesaikan tugasku di bawah sana, tapi perang yang sesungguhnya baru akan dimulai. ", action: ''),
  Dialogue(id :  23,character: '[PLAYER_NAME]', text: "Aku tahu kau bukan sekadar penjaga tavern biasa. dungeon itu, tidak semua orang tahu. hanya orang-orang yang hendak memberontak lah yang pergi kesana dan bertaruh nasib. ", action: ''),
  Dialogue(id :  24,character: '[PLAYER_NAME]', text: "Nyonya, Matamu menyimpan bara api yang sama dengan mereka yang gugur di saluran itu dan aku butuh bantuanmu. Bawa aku pada mereka—para petarung terkuat, para pemberontak, siapa saja yang sudah muak diinjak-injak! Kita tidak akan bersembunyi lagi. Kumpulkan pasukan sebanyak mungkin. sudah saatnya kalian tidak diinjak-injak lagi", action: ''),
  Dialogue(id :  25,character: 'Nyonya Stroberi', text: "(Wajahnya menyala penuh semangat) 'Akhirnya hari ini tiba! Kau datang ke orang yang tepat, Nak. Aku akan mengumpulkan para pejuang, bandit, dan setiap orang yang lelah diinjak-injak oleh 'mereka'. Persiapan dimulai!'", action: 'navigate_toCampaign'),
  Dialogue(id :  26,character: 'Loading...', text: " ", action: ''),
  Dialogue(id :  27,character: 'Nyonya Stroberi', text: "", action: ''),
];