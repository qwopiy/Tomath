import 'package:flutter/material.dart';
import 'package:tomath/widget/woodbutton.dart';

class IntroGreetingByName extends StatelessWidget {
  final String name;
  final VoidCallback onNext;
  final String buttonText;

  const IntroGreetingByName({
    super.key,
    required this.name,
    required this.onNext,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final panelHeight = size.height * 0.30;

    final topMargin = size.height * 0.55;

    return Container(
      height: panelHeight,
      margin: EdgeInsets.only(top: topMargin),
      padding: EdgeInsets.all(size.width * 0.05),

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
              "what a lovely name,\n$name if you have any questions don’t hesitate to ask",
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'BaskervvilleSC',
              ),
              textAlign: TextAlign.start,
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: WoodButton(
              text: buttonText,
              onTap: onNext,
            ),
          ),
        ],
      ),
    );
  }
}
