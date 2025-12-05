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
                backgroundImage: 'assets/ui/PapanMadingNew.png',

                buttonWidth: 150,
                buttonHeight: 50,

                showLeftButton: false,

                showRightButton: true,
                rightButtonText: "Enter",
                rightButtonOnTap: () {
                  print("Right button pressed!");
                },
                rightButtonAlignment: Alignment.bottomRight,
                rightButtonPadding: EdgeInsets.only(right: 70, bottom: 65),

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