import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomath/provider/quiz_provider.dart';
import 'package:tomath/widget/choice_button.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  String questionText = 'Question not loaded';
  List<String> choices = [
    'Pilihan 1',
    'Pilihan 2',
    'Pilihan 3',
    'Pilihan 4',
  ];

  late QuizProvider qProvider;

  @override
  void initState() {
    qProvider = Provider.of<QuizProvider>(context, listen: false); // untuk mempersingkat method call
    qProvider.reset();
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
                      // padding 100 untuk setting
                      child: Column(
                        children: [
                          // atas: soal
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/ui/kertasPipih.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 40, right: 40),
                                child: Text(
                                  questionText,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          // bawah: gambar player dan musuh
                          Expanded(
                            flex: 4,
                            child: Container(
                              color: Colors.orange,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  // gambar player
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(image: AssetImage(
                                          'assets/images/FreakyBug.png'),
                                        width: 80,
                                        height: 80,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Player',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // gambar musuh
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(image: AssetImage(
                                          'assets/images/FreakyBug.png'),
                                        width: 80,
                                        height: 80,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Musuh',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
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
                      spacing: 30.0,
                      runSpacing: 30.0,
                      direction: Axis.horizontal,
                      children: [
                        ChoiceButton(
                          buttonText: choices[0],
                          onPressed: () {
                            qProvider.nextQuestion();
                          },
                        ),
                        ChoiceButton(
                          buttonText: choices[1],
                          onPressed: () {
                            qProvider.nextQuestion();
                          },
                        ),
                        ChoiceButton(
                          buttonText: choices[2],
                          onPressed: () {
                            qProvider.nextQuestion();
                          },
                        ),
                        ChoiceButton(
                          buttonText: choices[3],
                          onPressed: () {
                            qProvider.nextQuestion();
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