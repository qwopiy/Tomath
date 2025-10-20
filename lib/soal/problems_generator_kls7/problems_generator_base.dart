import 'dart:math';

abstract class PGBase {
  int bab;
  int subBabAmount;
  PGBase(this.bab, this.subBabAmount);

  String question = "";
  int playerAnswer = 0; // range 0 - 3 untuk pilihan ganda abcd

  late int num0;
  late int num1;
  late int num2;
  late int num3;
  late String op0;
  late String op1;
  late String op2;
  late int answer;
  List<int> choices = [0,0,0,0];

  int activeDifficulty = 0;

  // inclusive min, inclusive max
  int randomNum(int min, int max, [bool? includeZero]) {
    int num;
    do {
      num = Random().nextInt(max + 1 - min) + min;
    } while (num == 0 && includeZero == false);
    return num;
  }

  List<int> getAllFactors(int n) {
    int num = n.abs();
    List<int> factors = [];
    for (int i = -num; i <= num; i++) {
      if (i == 0) continue;
      if (n % i == 0) {
        factors.add(i);
      }
    }
    return factors;
  }

  void setQuestion(int subBab);
  void setAnswer(int subBab);
}