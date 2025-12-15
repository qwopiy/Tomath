import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/quiz_provider.dart';
import 'choice_button.dart';
import 'player_health.dart';

import '../models/materi.dart';
import '../service/app_state_provider.dart';
import 'rive_animation.dart';

class GameWidget extends StatefulWidget {
  final int bab;
  final int subBab;
  final bool? isTraining;
  final bool? isEvent;
  final String? enemyType;
  const GameWidget({
    super.key,
    required this.bab,
    required this.subBab,
    this.isTraining,
    this.isEvent,
    this.enemyType,
  });

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  late final appProvider = Provider.of<AppStateProvider>(context);
  final TextEditingController controller = TextEditingController();
  late bool canBeEssay = Materi.canBeEssay[widget.bab - 1][widget.subBab - 1];
  bool _essayQuestion = true;
  late String answer;

  final double _playerHeight = 100;

  bool _inAnimation = false;
  bool _isPlayerAttacking = false;
  bool _isPlayerGetHit = false;
  bool _isEnemyAttacking = false;
  bool _isEnemyGetHit = false;

  String questionText = 'Question not loaded';
  List<String> choices = [
    'Pilihan 1',
    'Pilihan 2',
    'Pilihan 3',
    'Pilihan 4',
  ];

  void _triggerPlayerAttack() async {
    setState(() {
      _isPlayerAttacking = true;
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _isPlayerAttacking = false;
    });
  }

  void _triggerPlayerGetHit() async {
    setState(() {
      _isPlayerGetHit = true;
    });
    await Future.delayed(Duration(milliseconds: 400));
    setState(() {
      _isPlayerGetHit = false;
    });
  }

  void _triggerEnemyAttack() async {
    setState(() {
      _isEnemyAttacking = true;
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _isEnemyAttacking = false;
    });
  }

  void _triggerEnemyGetHit() async {
    setState(() {
      _isEnemyGetHit = true;
    });
    await Future.delayed(Duration(milliseconds: 400));
    setState(() {
      _isEnemyGetHit = false;
    });
  }

  Future<void> triggerAnimationFromAnswer(QuizProvider qp, bool isCorrect) async {
    setState(() {
      _inAnimation = true;
    });
    if (isCorrect){
      _triggerPlayerAttack();
    await Future.delayed(Duration(milliseconds: 400));
      _triggerEnemyGetHit();
    } else {
      _triggerEnemyAttack();
    await Future.delayed(Duration(milliseconds: 400));
      _triggerPlayerGetHit();
    }
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _inAnimation = false;
    });
  }

  Future<void> _chooseOption(BuildContext context, QuizProvider quizProvider, int option) async {
    if (_inAnimation) return;
    quizProvider.optionSelected(option, widget.isTraining ?? false, context);
    await triggerAnimationFromAnswer(quizProvider, quizProvider.isCorrectAnswer(option));
    if (context.mounted) {
      if (canBeEssay) {
        setState(() {
          _essayQuestion = Random().nextBool();
        });
      }
      quizProvider.nextQuestion(context, widget.isTraining ?? false, widget.isEvent);
    }

  }

  Future<void> _answerGiven(BuildContext context, QuizProvider quizProvider, String input) async {
    if (_inAnimation) return;
    quizProvider.answerGiven(input, widget.isTraining ?? false, context);
    await triggerAnimationFromAnswer(quizProvider, quizProvider.validateAnswer(input));
    if (context.mounted) {
      if (canBeEssay) {
        setState(() {
          _essayQuestion = Random().nextBool();
        });
      }
      quizProvider.nextQuestion(context, widget.isTraining ?? false, widget.isEvent);
    }

  }

  Widget answerWidget(QuizProvider quizProvider, bool isChoice) {
    if (isChoice) {
      return choiceQuiz(quizProvider);
    }
    else {
      return formQuiz(quizProvider);
    }
  }

  Widget choiceQuiz(QuizProvider quizProvider) {
    return Wrap(
      spacing: MediaQuery.of(context).size.width / 8,
      runSpacing: MediaQuery.of(context).size.width / 8,
      direction: Axis.horizontal,
      children: [
        ChoiceButton(
          buttonText: choices[0],
          onPressed: () async {
            _chooseOption(context, quizProvider, 0);
          },
        ),
        ChoiceButton(
          buttonText: choices[1],
          onPressed: () async {
            _chooseOption(context, quizProvider, 1);
          },
        ),
        ChoiceButton(
          buttonText: choices[2],
          onPressed: () async {
            _chooseOption(context, quizProvider, 2);
          },
        ),
        ChoiceButton(
          buttonText: choices[3],
          onPressed: () async {
            _chooseOption(context, quizProvider, 3);
          },
        ),
      ],
    );
  }

  Widget _button(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 45,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/ui/NavbarKayu.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'LuckiestGuy',
          ),
        ),
      ),
    );
  }

  Widget formQuiz(QuizProvider quizProvider) {
    return Align(
      alignment: const Alignment(0, 0.50),
      // x: horizontal (-1 kiri, 1 kanan)
      // y: vertical (-1 atas, 1 bawah)

      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Expanded(flex: 5,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/ui/kertasPipih.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25) ,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Ketik Jawaban',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'LuckiestGuy',
                    ),
                    // border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),

                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'LuckiestGuy',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: _button("Confirm", () {
                  _answerGiven(context, quizProvider, controller.text);
                }),
              ),
            ),
          ],
        ),
      )
    );
  }

  @override
  void initState() {
    Provider.of<QuizProvider>(context, listen: false).setBab(widget.bab, widget.subBab);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        questionText = quizProvider.question;
        choices = quizProvider.options;

        // print("Building CampaignScreen with question: $questionText");
        // print("Choices: $choices");

        return Scaffold(
          backgroundColor: Color(0xffEED7A1),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            // Column membagi layar jadi 2 kolom (atas dan bawah)
            child: Column(
              children: [
                // atas: gambar player, musuh, soal
                Expanded(
                  flex: 6,
                  child: Container(
                    // color: Colors.blue,
                    // layar atas dibagi 2 juga
                    // atas: soal
                    // bawah: gambar player dan musuh
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      // padding 60 untuk setting
                      child: Column(
                        children: [
                          // atas: soal
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/ui/kertasKecil.png'
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 45, right: 55),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Text(
                                    questionText,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'LuckiestGuy',
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // bawah: gambar player dan musuh
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50, right: 50),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/ui/kertasKecil.png'
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // gambar player
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Transform.translate(
                                          offset: const Offset(20, 20),
                                          child: PlayerHealth(isTraining: widget.isTraining ?? false),
                                        ),
                                        SizedBox(
                                          height: _playerHeight,
                                          width: _playerHeight,
                                          child: Transform.translate(
                                            offset: const Offset(20, -20),
                                            child: CustomRIVEAnimation(
                                              artboardName: appProvider.player.skin_path,
                                              isAttack: _isPlayerAttacking,
                                              isGetHit: _isPlayerGetHit,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // gambar musuh
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          width: MediaQuery.of(context).size.width / 3,
                                        ),
                                        SizedBox(
                                          height: _playerHeight,
                                          width: _playerHeight,
                                          child: Transform.translate(
                                            offset: const Offset(-20, -20),
                                            child: CustomRIVEAnimation(
                                              artboardName: widget.enemyType ?? 'Rambutan',
                                              isAttack: _isEnemyAttacking,
                                              isGetHit: _isEnemyGetHit,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // bawah: pilihan jawaban
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/ui/PapanKayuShort.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: answerWidget(quizProvider, _essayQuestion),
                    // wrap dari kiri ke kanan, overflow ke bawah
                    // child: Wrap(
                    //   spacing: MediaQuery.of(context).size.width / 8,
                    //   runSpacing: MediaQuery.of(context).size.width / 8,
                    //   direction: Axis.horizontal,
                    //   children: [
                    //     ChoiceButton(
                    //       buttonText: choices[0],
                    //       onPressed: () async {
                    //         _chooseOption(context, quizProvider, 0);
                    //       },
                    //     ),
                    //     ChoiceButton(
                    //       buttonText: choices[1],
                    //       onPressed: () async {
                    //         _chooseOption(context, quizProvider, 1);
                    //       },
                    //     ),
                    //     ChoiceButton(
                    //       buttonText: choices[2],
                    //       onPressed: () async {
                    //         _chooseOption(context, quizProvider, 2);
                    //       },
                    //     ),
                    //     ChoiceButton(
                    //       buttonText: choices[3],
                    //       onPressed: () async {
                    //         _chooseOption(context, quizProvider, 3);
                    //       },
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}