import 'soal/problems_generator_kls7/problems_generator_bab0.dart';

void main() {
  print("Testing Bab 0");
  Bab0 bab0 = Bab0(0, 3);
  bab0.setQuestion(1);
  // print(bab0.question);
  print("a = ${bab0.choices[0]}");
  print("b = ${bab0.choices[1]}");
  print("c = ${bab0.choices[2]}");
  print("d = ${bab0.choices[3]}");
  
  // print(bab0.getAllFactors(100));

}