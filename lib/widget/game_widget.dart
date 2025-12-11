import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomath/provider/quiz_provider.dart';
import 'package:tomath/widget/choice_button.dart';
import 'package:tomath/widget/player_health.dart';

import '../service/app_state_provider.dart';
import 'rive_animation.dart';

class GameWidget extends StatefulWidget {
  final int bab;
  final int subBab;
  final bool? isTraining;
  final double _playerHeight = 150;
  const GameWidget({
    super.key,
    required this.bab,
    required this.subBab,
    this.isTraining,
  });

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  late final appProvider = Provider.of<AppStateProvider>(context);
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

  Future<void> triggerAnimationFromAnswer(QuizProvider qp,int index) async {
    setState(() {
      _inAnimation = true;
    });
    if (qp.isCorrectAnswer(index)){
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

        print("Building CampaignScreen with question: $questionText");
        print("Choices: $choices");

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
                    color: Colors.blue,
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
                                      'assets/ui/kertasKecil.png'),
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
                                      fontWeight: FontWeight.bold,
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
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/ui/kertasKecil.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  // gambar player
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      PlayerHealth(isTraining: widget.isTraining ?? false),
                                      SizedBox(
                                        height: widget._playerHeight,
                                        width: MediaQuery.of(context).size.width / 3,
                                        child: CustomRIVEAnimation(
                                          artboardName: appProvider.player.skin_path,
                                          isAttack: _isPlayerAttacking,
                                          isGetHit: _isPlayerGetHit,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // gambar musuh
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: kToolbarHeight - 20,
                                        width: MediaQuery.of(context).size.width / 3,
                                      ),
                                      SizedBox(
                                        height: widget._playerHeight,
                                        width: MediaQuery.of(context).size.width / 3,
                                        child: CustomRIVEAnimation(
                                          artboardName: "Rambutan",
                                          isAttack: _isEnemyAttacking,
                                          isGetHit: _isEnemyGetHit,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    alignment: Alignment.center,
                    // wrap dari kiri ke kanan, overflow ke bawah
                    child: Wrap(
                      spacing: MediaQuery.of(context).size.width / 8,
                      runSpacing: MediaQuery.of(context).size.width / 8,
                      direction: Axis.horizontal,
                      children: [
                        ChoiceButton(
                          buttonText: choices[0],
                          onPressed: () async {
                            if (_inAnimation) return;
                            quizProvider.optionSelected(0, widget.isTraining, context);
                            await triggerAnimationFromAnswer(quizProvider, 0);
                            if (context.mounted) {
                              quizProvider.nextQuestion(context, widget.isTraining);
                            }
                          },
                        ),
                        ChoiceButton(
                          buttonText: choices[1],
                          onPressed: () async {
                            if (_inAnimation) return;
                            quizProvider.optionSelected(1, widget.isTraining, context);
                            await triggerAnimationFromAnswer(quizProvider, 1);
                            if (context.mounted) {
                              quizProvider.nextQuestion(context, widget.isTraining);
                            }
                          },
                        ),
                        ChoiceButton(
                          buttonText: choices[2],
                          onPressed: () async {
                            if (_inAnimation) return;
                            quizProvider.optionSelected(2, widget.isTraining, context);
                            await triggerAnimationFromAnswer(quizProvider, 2);
                            if (context.mounted) {
                              quizProvider.nextQuestion(context, widget.isTraining);
                            }
                          },
                        ),
                        ChoiceButton(
                          buttonText: choices[3],
                          onPressed: () async {
                            if (_inAnimation) return;
                            quizProvider.optionSelected(3, widget.isTraining, context);
                            await triggerAnimationFromAnswer(quizProvider, 3);
                            if (context.mounted) {
                              quizProvider.nextQuestion(context, widget.isTraining);
                            }
                          },
                        ),
                      ],
                    ),
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