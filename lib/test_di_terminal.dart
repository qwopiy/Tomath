import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'data.db');
  var db = await openDatabase(path, version: 1);

  List<Map<String, dynamic>> question = [
    {
      "id": "101",
      "bab": "Bilangan Bulat",
      "problem": "Hasil dari (-3) + 7 adalah ...",
      "options": ["-10", "4", "10", "-4"],
      "answer": "4",
      "solution": "Karena -3 + 7 = 4."
    },
    {
      "id": "102",
      "bab": "Bilangan Bulat",
      "problem": "Hasil dari 8 - (-5) adalah ...",
      "options": ["3", "13", "-3", "-13"],
      "answer": "13",
      "solution": "8 - (-5) = 8 + 5 = 13."
    },
    {
      "id": "103",
      "bab": "Bilangan Bulat",
      "problem": "Hasil dari (-9) + (-6) adalah ...",
      "options": ["15", "-15", "3", "-3"],
      "answer": "-15",
      "solution": "Menjumlahkan dua bilangan negatif menghasilkan -15."
    },
    {
      "id": "104",
      "bab": "Bilangan Bulat",
      "problem": "Hasil dari 12 + (-8) adalah ...",
      "options": ["20", "4", "-4", "-20"],
      "answer": "4",
      "solution": "12 + (-8) = 12 - 8 = 4."
    },
    {
      "id": "105",
      "bab": "Bilangan Bulat",
      "problem": "Hasil dari (-10) - (-4) adalah ...",
      "options": ["-14", "-6", "6", "14"],
      "answer": "-6",
      "solution": "(-10) - (-4) = (-10) + 4 = -6."
    },
    {
      "id": "106",
      "bab": "Bilangan Bulat",
      "problem": "Nilai dari 7 × (-3) adalah ...",
      "options": ["-21", "21", "10", "-10"],
      "answer": "-21",
      "solution": "Bilangan positif dikali negatif menghasilkan negatif: 7 × (-3) = -21."
    },
    {
      "id": "107",
      "bab": "Bilangan Bulat",
      "problem": "Hasil dari (-5) × (-6) adalah ...",
      "options": ["-30", "30", "-11", "11"],
      "answer": "30",
      "solution": "Negatif × negatif = positif, jadi hasilnya 30."
    },
    {
      "id": "108",
      "bab": "Bilangan Bulat",
      "problem": "Hasil dari 48 ÷ (-6) adalah ...",
      "options": ["-8", "8", "-6", "6"],
      "answer": "-8",
      "solution": "Positif ÷ negatif = negatif, jadi hasilnya -8."
    },
    {
      "id": "109",
      "bab": "Bilangan Bulat",
      "problem": "Hasil dari (-36) ÷ 9 adalah ...",
      "options": ["-4", "-3", "3", "4"],
      "answer": "-4",
      "solution": "Negatif ÷ positif = negatif, hasilnya -4."
    },
    {
      "id": "110",
      "bab": "Bilangan Bulat",
      "problem": "Hasil dari (-2)³ adalah ...",
      "options": ["8", "-8", "4", "-4"],
      "answer": "-8",
      "solution": "(-2)³ = (-2) × (-2) × (-2) = -8."
    }
  ];

  for (var q in question) {
    await db.insert('Question', q);
  }

  print('Questions inserted successfully');
}