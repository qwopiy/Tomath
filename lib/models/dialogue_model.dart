class Dialogue{
  final int id;
  final String character;
  final String text;
  final String action;

  const Dialogue({
    required this.id,
    required this.character,
    required this.text,
    required this.action,
  });
}


const List<Dialogue> initialDialogues = [
  Dialogue(id: 0, character: 'Nyonya Stroberi', text: "Astaga, seorang petualang! Sudah lama kami tak kedatangan wajah baru di sini. Apa yang membawa Tuan yang gagah berani kemari? Siapa namamu, Nak?", action: ''),
  Dialogue(id: 1, character: 'Nyonya Stroberi', text: "", action: 'input_username'),
  Dialogue(id: 2, character: '[PLAYER_NAME]', text: "namaku [PLAYER_NAME], senang bertemu denganmu nyonya. ", action: ''),
  Dialogue(id: 3, character: 'Nyonya Stroberi', text: "Nama yang indah. selamat datang di Tavert Strauberr-Haus, [PLAYER_NAME]. ", action: 'navigate_toHome'),
  Dialogue(id: 4, character: 'Nyonya Stroberi', text: "E", action: ''),
  Dialogue(id: 5, character: 'Nyonya Stroberi', text: "F", action: ''),
  Dialogue(id: 6, character: 'Nyonya Stroberi', text: "G", action: ''),
  Dialogue(id: 7, character: 'Nyonya Stroberi', text: "H", action: ''),
];