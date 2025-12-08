import 'package:flutter/material.dart';

import '../widget/introgreetinbyname.dart';
import '../widget/introgreeting.dart';
import '../widget/introinputname.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int step = 0;
  final TextEditingController nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (step == 0) {
      content = IntroGreeting(
        onNext: () => setState(() => step = 1),
        buttonText: "Next",
      );
    } else if (step == 1) {
      content = IntroInputName(
        controller: nameC,
        onNext: () => setState(() => step = 2),
        buttonText: "Confirm",
      );
    } else {
      content = IntroGreetingByName(
        name: nameC.text,
        onNext: () {},
        buttonText: "Next",
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffe8b882),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/HomeBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: content),
      ),
    );
  }
}