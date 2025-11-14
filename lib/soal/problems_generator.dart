import 'package:tomath/soal/problems_generator_kls7/problems_generator_base.dart';

class ProblemGenerator {
  int currentBab = 0;
  int currentSubBab = 0;

  late List<PGBase> problems;

  void setCurrentBab(int n){
    currentBab = n;
    currentSubBab = 0;
  }

  void setCurrentSubBab(int n) {
    currentSubBab = n;
  }

  void setCurrentProblems() {

  }
}