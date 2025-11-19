import 'package:flutter/material.dart';
import 'package:tomath/widget/plank_info.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8b882),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/HomeBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(flex: 2,
              child: SizedBox.shrink(),
            ),
            Expanded(flex: 8,
              child: PlankInfo(
                buttonText: 'Confirm',
                backgroundImage: 'assets/ui/PapanMadingNew.png',

              ),
            ),
            Expanded(flex: 2,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}