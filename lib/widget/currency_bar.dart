import 'package:flutter/material.dart';

class CurrencyBar extends StatelessWidget {
  final String backgroundImage;
  final String currencyIcon;
  final int amount;
  final double barHeight;

  const CurrencyBar({
    super.key,
    required this.backgroundImage,
    required this.currencyIcon,
    required this.amount,
    this.barHeight = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: barHeight + 10,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: barHeight,
            // width: ,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Positioned.fill(
            child: Row(
              children: [
                SizedBox(width: barHeight * 0.50),
                Expanded(
                  child: Text(
                    amount.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: barHeight * 0.45,
                      fontFamily: "",
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -barHeight * 0.15,
            left: -14,

            child: Image.asset(
              currencyIcon,
              width: 100,
              height:60,
            ),
          ),
        ],
      ),
    );
  }
}
