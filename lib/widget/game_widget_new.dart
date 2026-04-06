import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../provider/quiz_provider.dart';
import '../service/audio_provider.dart';
import 'choice_button.dart';
import 'player_health.dart';

import '../models/materi.dart';
import '../service/app_state_provider.dart';
import 'rive_animation.dart';
import 'setting_button.dart';

class GameWidgetNew extends StatefulWidget {
  final int bab;
  final int subBab;
  final GameType gameType;
  final int rewards;
  final String? enemyType;
  const GameWidgetNew({
    super.key,
    required this.bab,
    required this.subBab,
    required this.gameType,
    required this.rewards,
    this.enemyType,
  });

  @override
  State<GameWidgetNew> createState() => _GameWidgetNewState();
}

class _GameWidgetNewState extends State<GameWidgetNew> {
  late final appProvider = Provider.of<AppStateProvider>(context);
  late final audioProvider = Provider.of<AudioProvider>(context, listen: false);
  final TextEditingController controller = TextEditingController();
  late bool canBeEssay = Materi.canBeEssay[widget.bab - 1][widget.subBab - 1];
  bool _essayQuestion = true;
  late String answer;

  late double _playerHeight;

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
    audioProvider.playSfx(AppSfx.attack);
    setState(() {
      _isPlayerAttacking = false;
    });
  }

  void _triggerPlayerGetHit() async {
    setState(() {
      _isPlayerGetHit = true;
    });
    await Future.delayed(Duration(milliseconds: 400));
    audioProvider.playSfx(AppSfx.getHit);
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
    quizProvider.optionSelected(option, widget.subBab, widget.gameType, context);
    await triggerAnimationFromAnswer(quizProvider, quizProvider.isCorrectAnswer(option));
    if (context.mounted) {
      if (canBeEssay) {
        setState(() {
          _essayQuestion = Random().nextBool();
        });
      }
      quizProvider.nextQuestion(context, widget.subBab, widget.rewards, widget.gameType);
    }

  }

  Future<void> _answerGiven(BuildContext context, QuizProvider quizProvider, String input) async {
    if (_inAnimation) return;
    quizProvider.answerGiven(input, widget.subBab, widget.gameType, context);
    await triggerAnimationFromAnswer(quizProvider, quizProvider.validateAnswer(input));
    if (context.mounted) {
      if (canBeEssay) {
        setState(() {
          _essayQuestion = Random().nextBool();
        });
      }
      quizProvider.nextQuestion(context, widget.subBab, widget.rewards, widget.gameType);
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
                    onSubmitted: (value) {
                      _answerGiven(context, quizProvider, value);
                      controller.text = '';
                    },
                    controller: controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Ketik Jawaban',
                      hintStyle: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFFF7EFD3),
                        fontFamily: 'LuckiestGuy',
                        shadows: [
                          Shadow(offset: Offset(2, 2), blurRadius: 0, color: Colors.black),
                          Shadow(offset: Offset(-2, -2), blurRadius: 0, color: Colors.black),
                          Shadow(offset: Offset(2, -2), blurRadius: 0, color: Colors.black),
                          Shadow(offset: Offset(-2, 2), blurRadius: 0, color: Colors.black),
                        ],
                      ),
                      // border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),

                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFFF7EFD3),
                      fontFamily: 'LuckiestGuy',
                      shadows: [
                        Shadow(offset: Offset(2, 2), blurRadius: 0, color: Colors.black),
                        Shadow(offset: Offset(-2, -2), blurRadius: 0, color: Colors.black),
                        Shadow(offset: Offset(2, -2), blurRadius: 0, color: Colors.black),
                        Shadow(offset: Offset(-2, 2), blurRadius: 0, color: Colors.black),
                      ],
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
            color: Color(0xFFF7EFD3),
            fontFamily: 'LuckiestGuy',
            shadows: [
              Shadow(offset: Offset(2, 2), blurRadius: 0, color: Colors.black),
              Shadow(offset: Offset(-2, -2), blurRadius: 0, color: Colors.black),
              Shadow(offset: Offset(2, -2), blurRadius: 0, color: Colors.black),
              Shadow(offset: Offset(-2, 2), blurRadius: 0, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Provider.of<QuizProvider>(context, listen: false).setBankSoal(widget.gameType ,widget.bab, widget.subBab);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // _playerHeight = MediaQuery.of(context).size.width / 4 + 10;
    _playerHeight = 175;

    // enemy sesuai subbab
    if (widget.gameType == GameType.campaign) {
      widget.enemyType ?? appProvider.subBabList[widget.subBab - 1].enemy;
    }
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        questionText = quizProvider.currentQuestion.text;
        choices = quizProvider.currentQuestion.options;
        return Scaffold(
          backgroundColor: Color(0xffffffff),
          body: Align(
            alignment: Alignment.center,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 75,
                    // decoration: BoxDecoration(
                    //   color: Color(0x1f000000),
                    //   shape: BoxShape.rectangle,
                    //   borderRadius: BorderRadius.zero,
                    //   border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    // ),
                    child:
                    Align(
                      alignment: Alignment(0.9, 0.0),
                      child: SettingButton(
                        buttonText: 'Beranda',
                        onPressed: () {
                          GoRouter.of(context).go('/home');
                          audioProvider.playBgm(AppMusic.homeTheme);
                        },
                      ),
                    ),
                  ),),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0x1f000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [


                      PlayerHealth(gameType: widget.gameType,)

                      ,

                      PlayerHealth(gameType: widget.gameType,)

                      ,
                    ],),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: _playerHeight - 1,
                  decoration: BoxDecoration(
                    color: Color(0x1f000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
                      SizedBox(
                        height: _playerHeight,
                        width: _playerHeight,
                        child: Transform.translate(
                          offset: const Offset(-25, -20),
                          child: CustomRIVEAnimation(
                            artboardName: widget.enemyType ?? 'Rambutan',
                            isAttack: _isEnemyAttacking,
                            isGetHit: _isEnemyGetHit,
                          ),
                        ),
                      ),
                    ],
                  ),
                )

                ,
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0x1f000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child:
                  Align(
                    alignment: Alignment.center,
                    child: Expanded(
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
                                color: Color(0xFFF7EFD3),
                                fontFamily: 'LuckiestGuy',
                                shadows: [
                                  Shadow(offset: Offset(2, 2), blurRadius: 0, color: Colors.black),
                                  Shadow(offset: Offset(-2, -2), blurRadius: 0, color: Colors.black),
                                  Shadow(offset: Offset(2, -2), blurRadius: 0, color: Colors.black),
                                  Shadow(offset: Offset(-2, 2), blurRadius: 0, color: Colors.black),
                                ],
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.4,
                  decoration: BoxDecoration(
                    color: Color(0x1f000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child:

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
                    ),
                  ),
                ),
              ],),),
        )
        ;
      }
    )
    ;}
}
