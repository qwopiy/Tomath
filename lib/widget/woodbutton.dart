import 'package:flutter/material.dart';


class WoodButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const WoodButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/ui/NavbarKayu.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFFF7EFD3),
            fontWeight: FontWeight.bold,
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
}
