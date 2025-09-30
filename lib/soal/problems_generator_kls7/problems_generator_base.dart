abstract class PGBase {
  int bab;
  int subBabAmount;
  PGBase(this.bab, this.subBabAmount);

  String question = "";
  int answer = 0; // range 0 - 3 untuk pilihan ganda abcd

  void setQuestion(int subBab);
  void setAnswer(int n);
}