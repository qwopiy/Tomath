import 'package:flutter/material.dart';
import 'package:tomath/widget/plank_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8b882),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/HomeBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(flex: 2,
              child: SizedBox.shrink(),
            ),
            Expanded(flex: 8,
              child: PlankInfo(
                showButton: false,
                backgroundImage: 'assets/ui/PapanKayuShortNew.png',
                child: Column(
                  children: [
                    Expanded(flex: 1,
                      child: Container(
                        // color: Colors.white,
                      ),
                    ),
                    Expanded(flex: 1,
                      child: Container(
                        // color: Colors.red,
                      ),
                    ),
                    Expanded(flex: 1,
                      child: Container(
                        // color: Colors.green,
                      ),
                    ),
                  ]
                ),
              ),
            ),
            Expanded(flex: 2,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}