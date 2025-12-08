import 'package:flutter/material.dart';

class LevelPopup extends StatelessWidget {
  final int level;
  const LevelPopup({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.50),
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 0.4,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ui/KertasGede.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Level $level",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),
                const Text(
                  "Ready to start this level?",
                  style: TextStyle(fontSize: 18),
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _button("Back", () => Navigator.pop(context)),
                    const SizedBox(width: 15),
                    _button("Accept", () => Navigator.pop(context)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
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
            fit: BoxFit.fill,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
