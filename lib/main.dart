import 'package:flutter/material.dart';
import 'package:tomath/Config/Routes.dart';
import 'package:tomath/screen/campaign_screen.dart';

void main() {
  runApp(const Tomath());
}

class Tomath  extends StatelessWidget {
  const Tomath ({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tomath',

      // CampaignScreen();
      routerConfig: createRouter(),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:tomath/screen/campaign_screen.dart';
//
// void main() {
//   runApp(const Tomath());
// }
//
// class Tomath extends StatelessWidget {
//   const Tomath({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tomath',
//       home: const CampaignScreen(),
//     );
//   }
// }
//
