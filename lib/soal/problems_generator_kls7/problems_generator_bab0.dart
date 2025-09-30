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

  String qFormat0() {
    return "Hasil dari $a $op0 ${b < 0 ? "($b)" : "$b"}  = ...";
  }

  String qFormat1() {
    return "Hasil dari $a $op0 ${b < 0 ? "($b)" : "$b"} $op1 ${c < 0 ? "($c)" : "$c"} = ...";
  }

  String qFormat2() {
    return "Hasil dari $a $op0 ${b < 0 ? "($b)" : "$b"} $op1 ${c < 0 ? "($c)" : "$c"} $op2 ${d < 0 ? "($d)" : "$d"} = ...";
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
  void setAnswer(int n) {
    // TODO: implement setAnswer
  }

  @override
  void setQuestion(int subBab) {
    switch (subBab) {
      case 0:
        a = Random().nextInt(40) - 20 + 1;
        op0 = Random().nextBool() ? "+" : "-";
        b = Random().nextInt(20) - 10 + 1;
        op1 = Random().nextBool() ? "+" : "-";
        c = Random().nextInt(50) - 25 + 1;
        op2 = Random().nextBool() ? "+" : "-";
        d = Random().nextInt(20) - 10 + 1;

        question = setQFormat(Random().nextInt(3));
        break;
      case 1:
        break;
      case 2:
        break;
      default:
        question = "Soal belum tersedia";
        break;
    }
  }
}