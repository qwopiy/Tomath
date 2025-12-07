import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tomath/provider/quiz_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              child: Container(
                margin: const EdgeInsets.only(right: 20.0, bottom: 30.0),
                alignment: Alignment.bottomRight,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: 200,
                  height: 150,
                  child: InkWell(
                    onTap: () {
                      print('tombol Play ditekan');
                      QuizProvider().resetQuestion(100, 200); // temp: untuk bab 1 (id 100 - 200)
                      GoRouter.of(context).push('/campaign');
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          'assets/ui/play_concept.png',
                          width: 200,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                        Text('Play', style: TextStyle(
                          // fontFamily: 'LuckiestGuy',
                          fontSize: 30,
                          color: Colors.white,
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 2,
              child: Container(

                // color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}