import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/sub_bab_model.dart';

class LevelPopup extends StatelessWidget {
  final SubBabModel subBab;
  final int level;
  final String title;
  const LevelPopup({super.key, required this.level, required this.subBab, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    final String enemy = subBab.enemy;
    final int bab = subBab.bab_id;

    return Align(
      alignment: const Alignment(0, 0),
      child: FractionallySizedBox(
        widthFactor: isLandscape ? 0.8 : 1,
        heightFactor: isLandscape ? 0.85 : 0.75,
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

                String subBabInfo = subBab.is_finished == 0 ? subBab.before_winning_info : subBab.after_winning_info;
                if (subBabInfo.contains('[PLAYER_TITLE]')){
                  subBabInfo.replaceAll('[PLAYER_TITLE]', title);
                }

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TOP ROW
                      Row(
                        children: [
                          Container(
                            width: isLandscape ? 45 : 100,
                            height: isLandscape ? 45 : 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/character/$enemy.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              subBabInfo,
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
                        "MISSION: ",
                        style: TextStyle(
                          fontSize: textSize,
                          color: Colors.black,
                          fontFamily: "Baskerville",
                        ),
                      ),
                      Text(
                        subBab.mission,
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
                        subBab.material,
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
                            subBab.reward.toString(),
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
                          _button("Accept", () => GoRouter.of(context).push('/campaigngame$bab$level'), textSize),
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