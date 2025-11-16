import 'package:flutter/material.dart';
import 'package:tomath/widget/currency_bar.dart';

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
              child: Row(
                children: [
                  Expanded(flex: 1,
                    child: CurrencyBar(
                      backgroundImage: 'assets/ui/kertasPipihPol.png',
                      currencyIcon: 'assets/ui/currency.png',
                      amount: 999999,
                    ),
                  ),
                  Expanded(flex: 1,
                    child: Container(
                      // color: Colors.red,
                    )
                  )
                ],
              ),
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
                      // context.push('/quiz');
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