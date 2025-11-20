import 'package:flutter/material.dart';

class PlankInfo extends StatelessWidget {
  final Widget? child;
  final double? height;

  final String backgroundImage;

  final bool showButton;
  final String buttonText;
  final VoidCallback? onButtonTap;

  const PlankInfo({
    super.key,
    this.child,
    this.height,
    this.showButton = true,
    this.buttonText = "Edit",
    this.onButtonTap,
    this.backgroundImage = 'assets/ui/PapanKayuShort.png',
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

          if (showButton)
            Positioned(
              bottom: 60,
              right: 80,
              child: InkWell(
                onTap: onButtonTap,
                child: Container(
                  width: 150,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ui/NavbarKayu.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
