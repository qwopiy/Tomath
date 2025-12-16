import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget{
  final String buttonText;
  final VoidCallback onPressed;

  const ChoiceButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/ui/kertasKecil.png'),
            fit: BoxFit.scaleDown,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: 'LuckiestGuy',
          ),
        ),
      ),
    );
  }
}