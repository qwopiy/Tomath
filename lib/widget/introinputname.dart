import 'package:flutter/material.dart';
import 'package:tomath/widget/woodbutton.dart';

class IntroInputName extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onNext;
  final String buttonText;

  const IntroInputName({
    super.key,
    required this.controller,
    required this.onNext,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final panelHeight = size.height * 0.20;

    final topMargin = size.height * 0.55;

    final textFieldHeight = size.height * 0.07;

    return Container(
      height: panelHeight,
      margin: EdgeInsets.only(top: topMargin),
      padding: EdgeInsets.all(size.width * 0.05),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          SizedBox(height: size.height * 0.02),

          Container(
            height: textFieldHeight,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/ui/kertasPipih.png'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(12),
            ),

            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'BaskervvilleSC',
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "INPUT USERNAME",
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'BaskervvilleSC',
                ),
              ),
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
