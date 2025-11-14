import 'package:flutter/material.dart';
import 'package:tomath/screen/event_screen.dart';
import 'package:tomath/screen/home_screen.dart';
import 'package:tomath/screen/introduction_screen.dart';
import 'package:tomath/screen/shop_screen.dart';
import 'package:tomath/screen/training_screen.dart';

void main() {
  runApp(const Tomath());
}

class Tomath  extends StatelessWidget {
  const Tomath ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:
      // TrainingScreen()
      //   ShopScreen()
      EventScreen()
      // IntroductionScreen()
      // HomeScreen()
    );

  }
}
