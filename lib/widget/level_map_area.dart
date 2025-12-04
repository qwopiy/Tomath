import 'package:flutter/material.dart';
import 'level_button.dart';

class LevelMapArea extends StatelessWidget {
  final BoxConstraints constraints;
  final List<bool> levelActive;
  final Function(int) onPressed;

  const LevelMapArea({
    super.key,
    required this.constraints,
    required this.levelActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double w = constraints.maxWidth;
    double h = constraints.maxHeight;

    return SizedBox(
      height: h * 0.50,
      child: Row(
        children: [
          Expanded(child: Container()),

          SizedBox(
            width: w * 0.55,
            child: Stack(
              children: [
                Positioned(
                  top: h * 0.05,
                  left: w * 0.05,
                  child: LevelButton(
                    enabled: levelActive[0],
                    onTap: () => onPressed(1),
                  ),
                ),

                Positioned(
                  top: h * 0.08,
                  right: w * 0.03,
                  child: LevelButton(
                    enabled: levelActive[1],
                    onTap: () => onPressed(2),
                  ),
                ),

                Positioned(
                  bottom: h * 0.10,
                  left: w * 0.05,
                  child: LevelButton(
                    enabled: levelActive[2],
                    onTap: () => onPressed(3),
                  ),
                ),

                Positioned(
                  bottom: h * 0.12,
                  right: w * 0.07,
                  child: LevelButton(
                    enabled: levelActive[3],
                    onTap: () => onPressed(4),
                  ),
                ),
              ],
            ),
          ),

          Expanded(child: Container()),
        ],
      ),
    );
  }
}
