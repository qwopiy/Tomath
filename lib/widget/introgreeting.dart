import 'package:flutter/material.dart';
import 'package:tomath/widget/woodbutton.dart';

class IntroGreeting extends StatelessWidget {
  final VoidCallback onNext;
  final String buttonText;

  const IntroGreeting({
    super.key,
    required this.onNext,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final h = c.maxHeight;
        final w = c.maxWidth;

        return Container(
          height: h * 0.30,
          margin: EdgeInsets.only(top: h * 0.55),

          padding: EdgeInsets.symmetric(
            horizontal: w * 0.05,
            vertical: h * 0.03,
          ),

          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/ui/KertasGede.png'),
              fit: BoxFit.fill,
            ),
          ),

          child: Stack(
            children: [
              Center(
                child: Text(
                  "assalamualaikum, it’s been a long time since we had a visitor... may i know your name?",
                  style: TextStyle(
                    fontSize: h * 0.022,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'BaskervvilleSC',
                  ),
                  textAlign: TextAlign.start,
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: w * 0.28,
                  child: WoodButton(
                    text: buttonText,
                    onTap: onNext,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
