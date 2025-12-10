import 'package:flutter/material.dart';

class LevelPopup extends StatelessWidget {
  final int level;
  const LevelPopup({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    return Align(
      alignment: const Alignment(0, 0.50),
      child: FractionallySizedBox(
        widthFactor: isLandscape ? 0.8 : 1,
        heightFactor: isLandscape ? 0.85 : 0.6,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ui/KertasGede.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, c) {

                final double w = c.maxWidth;
                double textSize = isLandscape ? 16 : 20;
                double gap = isLandscape ? 10 : 18;

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TOP ROW
                      Row(
                        children: [
                          Container(
                            width: isLandscape ? 45 : 60,
                            height: isLandscape ? 45 : 60,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/ui/Home.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Bandit attacked the city. Defeat them to find clues about your sister",
                              style: TextStyle(
                                fontSize: textSize,
                                color: Colors.black,
                                fontFamily: "Baskerville",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: gap),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 2,
                          width: w  * 1,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: gap),
                      // MISSION
                      Text(
                        "MISSION:",
                        style: TextStyle(
                          fontSize: textSize,
                          color: Colors.black,
                          fontFamily: "Baskerville",
                        ),
                      ),
                      Text(
                        "DEFEAT THE BANDIT",
                        style: TextStyle(
                          fontSize: textSize,
                          color: Colors.black,
                          fontFamily: "Baskerville",
                        ),
                      ),
                      SizedBox(height: gap),
                      // MATERIAL
                      Text(
                        "MATERIAL:",
                        style: TextStyle(
                          fontSize: textSize,
                          color: Colors.black,
                          fontFamily: "Baskerville",
                        ),
                      ),
                      Text(
                        "GARIS BILANGAN (PENJUMLAHAN, PENGURANGAN)",
                        style: TextStyle(
                          fontSize: textSize,
                          color: Colors.black,
                          fontFamily: "Baskerville",
                        ),
                      ),
                      SizedBox(height: gap),
                      // REWARD
                      Text(
                        "REWARD:",
                        style: TextStyle(
                          fontSize: textSize,
                          color: Colors.black,
                          fontFamily: "Baskerville",
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/ui/currency.png',
                            width: w * 0.14,
                            height: w * 0.14,
                          ),
                          SizedBox(width: w * 0.01),
                          Text(
                            "100",
                            style: TextStyle(
                              fontSize: w * 0.07,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              shadows: const [
                                Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 3,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: gap * 2),
                      // BUTTONS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _button("Back", () => Navigator.pop(context), textSize),
                          const SizedBox(width: 12),
                          _button("Accept", () => Navigator.pop(context), textSize),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(String text, VoidCallback onTap, double textSize) {
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
          style: TextStyle(
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