import 'dart:math';

import 'package:tomath/soal/problems_generator_kls7/problems_generator_base.dart';

class Bab0 extends PGBase {
  Bab0(super.bab, super.subBabAmount);

  /*
  * Bab 0 : Bilangan Bulat
  * SubBab 0 : Penjumlahan dan Pengurangan
  * SubBab 1 : Perkalian dan Pembagian
  * SubBab 2 : FPB dan KPK
  */
  late int a;
  late int b;
  late int c;
  late int d;
  late String op0;
  late String op1;
  late String op2;
  late int answer;

  int activeDifficulty = 0;

  String qFormat0() {
    activeDifficulty = 0;
    return "Hasil dari $a $op0 ${b < 0 ? "($b)" : "$b"}  = ...";
  }

  String qFormat1() {
    activeDifficulty = 1;
    return "Hasil dari $a $op0 ${b < 0 ? "($b)" : "$b"} $op1 ${c < 0 ? "($c)" : "$c"} = ...";
  }

  String qFormat2() {
    activeDifficulty = 2;
    return "Hasil dari $a $op0 ${b < 0 ? "($b)" : "$b"} $op1 ${c < 0 ? "($c)" : "$c"} $op2 ${d < 0 ? "($d)" : "$d"} = ...";
  }

  int randomNum(int min, int max) {
    int num;
    do {
      num = Random().nextInt(max - min) + min;
    } while (num == 0);
    return num;
  }

  String setQFormat(int difficulty) {
    switch (difficulty) {
      case 0:
        return qFormat0();
      case 1:
        return qFormat1();
      case 2:
        return qFormat2();
      default:
        return "";
    }
  }

  @override
  void setAnswer() {
    int calculate(int x, int y, String op) => op == "+" ? x + y : x - y;

    switch (activeDifficulty) {
      case 0:
        answer = calculate(a, b, op0);
        break;
      case 1:
        answer = calculate(calculate(a, b, op0), c, op1);
        break;
      case 2:
        answer = calculate(calculate(calculate(a, b, op0), c, op1), d, op2);
        break;
      default:
        answer = 0;
        break;
    }
  }

  @override
  void setQuestion(int subBab) {
    switch (subBab) {
      // Penjumlahan dan pengurangan
      case 0:
        a = randomNum(-10, 10);
        op0 = Random().nextBool() ? "+" : "-";
        b = randomNum(-20, 20);
        op1 = Random().nextBool() ? "+" : "-";
        c = randomNum(-40, 40);
        op2 = Random().nextBool() ? "+" : "-";
        d = randomNum(-10, 10);

        question = setQFormat(Random().nextInt(3));
        break;

      // Perkalian dan pembagian
      case 1:
        a = randomNum(-10, 10);
        op0 = Random().nextBool() ? "+" : "-";
        b = randomNum(-20, 20);
        op1 = Random().nextBool() ? "+" : "-";
        c = randomNum(-40, 40);

        question = setQFormat(Random().nextInt(2));
        break;

      // FPB dan KPK
      case 2:
        break;

      default:
        question = "Soal belum tersedia";
        break;
    }
  }
}