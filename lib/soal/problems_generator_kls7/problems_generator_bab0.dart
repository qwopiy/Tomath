import 'dart:math';

import 'package:dart_eval/dart_eval.dart';
import 'package:tomath/soal/problems_generator_kls7/problems_generator_base.dart';

class Bab0 extends PGBase {
  Bab0(super.bab, super.subBabAmount);

  /*
  * Bab 0 : Bilangan Bulat
  * SubBab 0 : Penjumlahan dan Pengurangan
  * SubBab 1 : Perkalian dan Pembagian
  * SubBab 2 : FPB dan KPK
  */

  String qFormat0() {
    activeDifficulty = 0;
    return "$num0 $op0 ${num1 < 0 ? "($num1)" : "$num1"}";
  }

  String qFormat1() {
    activeDifficulty = 1;
    return "$num0 $op0 ${num1 < 0 ? "($num1)" : "$num1"} $op1 ${num2 < 0 ? "($num2)" : "$num2"}";
  }

  String qFormat2() {
    activeDifficulty = 2;
    return "$num0 $op0 ${num1 < 0 ? "($num1)" : "$num1"} $op1 ${num2 < 0 ? "($num2)" : "$num2"} $op2 ${num3 < 0 ? "($num3)" : "$num3"}";
  }

  String setQDifficulty(int difficulty) {
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

  void setChoices(int currentSubBab) {
    int correctAnswer = Random().nextInt(4);
    for (int i = 0; i < 4; i++){
      choices[i] = randomNum((-50 - currentSubBab * 100), (50 + currentSubBab * 100), true);
    }

    choices[correctAnswer] = answer;
  }

  @override
  void setAnswer(int subBab) {
    switch (subBab) {
      // Penjumlahan dan pengurangan
      case 0:
        // WARNING: Using eval can be dangerous if the input is not controlled. Make sure to sanitize inputs in production code.
        // kata si copilot
        answer = eval(question);
        break;

      // Perkalian dan pembagian
      case 1:
        answer = eval(question).toInt();
        break;

      // FPB dan KPK
      case 2:
        break;

      default:
        answer = 0;
        break;
    }
    setChoices(subBab);
  }

  @override
  void setQuestion(int subBab) {
    switch (subBab) {
      // Penjumlahan dan pengurangan
      case 0:
        num0 = randomNum(-10, 10);
        op0 = Random().nextBool() ? "+" : "-";
        num1 = randomNum(-20, 20);
        op1 = Random().nextBool() ? "+" : "-";
        num2 = randomNum(-40, 40);
        op2 = Random().nextBool() ? "+" : "-";
        num3 = randomNum(-10, 10);

        question = setQDifficulty(Random().nextInt(3));
        setAnswer(subBab);
        break;

      // Perkalian dan pembagian
      case 1:
        op0 = Random().nextBool() ? "*" : "/";
        op1 = Random().nextBool() ? "*" : "/";
        print("DEBUG: op0=$op0, op1=$op1");

        if (op0 == "*" && op1 == "*") {
          num0 = randomNum(-10, 10);
          num1 = randomNum(-10, 10);
          num2 = randomNum(-5, 5);
        } else if (op0 == "*" && op1 == "/") {
          num0 = randomNum(-10, 10);
          num1 = randomNum(-10, 10);
          int temp = num0 * num1;
          List<int> factors = getAllFactors(temp);
          num2 = factors[Random().nextInt(factors.length)];
        } else if (op0 == "/" && op1 == "*") {
          num1 = randomNum(-10, 10);
          num2 = randomNum(-5, 5);
          num0 = num1 * randomNum(-10, 10);
        } else {
          num0 = randomNum(-100, 100);
          List<int> factors = getAllFactors(num0);
          num1 = factors[Random().nextInt(factors.length)];
          factors = getAllFactors(num1);
          num2 = factors[Random().nextInt(factors.length)];
        }

        print("DEBUG: num0=$num0, num1=$num1, num2=$num2");
        question = setQDifficulty(Random().nextInt(2));
        print("DEBUG: $question");
        setAnswer(subBab);
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