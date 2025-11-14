import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

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
            Expanded(
              flex: 2,
              child: SizedBox.shrink(),
            ),
            Expanded(
              flex: 8,
              child: Container(
                margin: const EdgeInsets.only(),
                // alignment: Alignment.bottomRight,
                child: Container(
                  // color: Colors.white,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ui/PapanKayu.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // color: Colors.red,
                  // alignment: Alignment.bottomCenter,
                  // width: 200,
                  // height: 150,
                  // child: InkWell(
                  //   onTap: () {
                  //     print('tombol Play ditekan');
                  //     // context.push('/quiz');
                  //   },
                  //   child: Stack(
                  //     alignment: Alignment.bottomCenter,
                  //     children: [
                  //       Image.asset(
                  //         'assets/ui/play_concept.png',
                  //         width: 200,
                  //         height: 150,
                  //         fit: BoxFit.contain,
                  //       ),
                  //       Text('event', style: TextStyle(
                  //         // fontFamily: 'LuckiestGuy',
                  //         fontSize: 30,
                  //         color: Colors.white,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}