// Materi kelas 7
class Materi {
  static const List<String> bab = [
    'Bilangan Bulat',
    'Bilangan Rasional',
    'Rasio',
    'Aljabar',
    'Kesebangunan',
    'Data dan Diagram'
  ];
  // yang dikomen gabisa jadi isian
  static const List<List<String>> subBab = [
    ['Penjumlahan dan Pengurangan','Perkalian dan Pembagian','KPK dan FPB'],
    ['Konversi','Perbandingan','Perhitungan'],
    ['Konsep Rasio','Skala','Perbandingan Berbalik Nilai'],
    ['Dasar Aljabar','Sifat Aljabar','Pemodelan Aljabar'], // sifat, pemodelan
    ['Hubungan Sudut','Dasar Kesebangunan','Kesebangunan Segitiga'], // full bab 5
    ['Statistika','Jenis Data','Diagram'] // jenis data
  ];

  // bool yang menandakan yang mana aja bisa dan tidak bisa jadi isian
  static const List<List<bool>> canBeEssay = [
    [true, true, true],
    [true, true, true],
    [true, true, true],
    [true, false, false],
    [false, false, false],
    [true, false, true],
  ];

}

enum GameType {
  campaign,
  training,
  event,
  UTS,
  UAS
}
