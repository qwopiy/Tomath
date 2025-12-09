import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'woodbutton.dart';

class BottomInfoPanel extends StatelessWidget {
  const BottomInfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 25),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Chapter:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Chapter Algebra',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 12),

            WoodButton(
              text: "Back",
              onTap: () {
                context.pop();
              },
            )

            // InkWell(
            //   onTap: () {
            //     context.pop();
            //   },
            //   child: Container(
            //     width: 110,
            //     height: 45,
            //     alignment: Alignment.center,
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage('assets/ui/NavbarKayu.png'),
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //     child: const Text(
            //       "Back",
            //       style: TextStyle(
            //         fontSize: 18,
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
