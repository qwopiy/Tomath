import 'package:flutter/material.dart';

class PlankInfo extends StatelessWidget {
  final Widget? child;
  final double? height;

  final String backgroundImage;

  // Tombol kiri
  final bool showLeftButton;
  final String leftButtonText;
  final VoidCallback? leftButtonOnTap;
  final Alignment leftButtonAlignment;
  final EdgeInsets leftButtonPadding;

  // Tombol kanan
  final bool showRightButton;
  final String rightButtonText;
  final VoidCallback? rightButtonOnTap;
  final Alignment rightButtonAlignment;
  final EdgeInsets rightButtonPadding;

  // Ukuran tombol
  final double buttonWidth;
  final double buttonHeight;

  const PlankInfo({
    super.key,
    this.child,
    this.height,
    this.backgroundImage = 'assets/ui/PapanKayuShort.png',

    // Tombol kiri
    this.showLeftButton = true,
    this.leftButtonText = "Left",
    this.leftButtonOnTap,
    this.leftButtonAlignment = Alignment.bottomLeft,
    this.leftButtonPadding = const EdgeInsets.only(left: 60, bottom: 60),

    // Tombol kanan
    this.showRightButton = true,
    this.rightButtonText = "Edit",
    this.rightButtonOnTap,
    this.rightButtonAlignment = Alignment.bottomRight,
    this.rightButtonPadding = const EdgeInsets.only(right: 60, bottom: 60),

    // Ukuran tombol
    this.buttonWidth = 150,
    this.buttonHeight = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: child ?? const SizedBox.shrink(),
          ),

          // Tombol kiri
          if (showLeftButton)
            Align(
              alignment: leftButtonAlignment,
              child: Padding(
                padding: leftButtonPadding,
                child: _buildButton(
                  text: leftButtonText,
                  onTap: leftButtonOnTap,
                  width: buttonWidth,
                  height: buttonHeight,
                ),
              ),
            ),

          // Tombol kanan
          if (showRightButton)
            Align(
              alignment: rightButtonAlignment,
              child: Padding(
                padding: rightButtonPadding,
                child: _buildButton(
                  text: rightButtonText,
                  onTap: rightButtonOnTap,
                  width: buttonWidth,
                  height: buttonHeight,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback? onTap,
    required double width,
    required double height,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
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
            fontSize: 20,
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
