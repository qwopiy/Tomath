import 'package:flutter/material.dart';
import 'package:tomath/widget/plank_info.dart';

import '../widget/currency_bar.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8b882),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/ShopBG.png'),
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
            Expanded(flex: 4,
              child: SizedBox.shrink(),
            ),
            Expanded(flex: 4,
                child: PlankInfo(
                  child: Column(
                    children: [
                      Expanded(flex: 2,
                        child: Container(
                          // color: Colors.green,
                          child: Row(
                            children: [
                              Expanded(flex: 1,
                                child: Container(),
                              ),
                              Expanded(flex: 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 120,
                                        height: 120,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/ui/kertasPipih.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/background/ShopBG.png',
                                              width: 70,
                                              height: 70,
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/ui/currency.png',
                                                  width: 30,
                                                  height: 30,
                                                ),
                                                const SizedBox(width: 4),
                                                const Text(
                                                  '10.000',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),


                                    InkWell(
                                      onTap: () {
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 120,
                                        height: 120,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/ui/kertasPipih.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/background/TrainingBG.png',
                                              width: 70,
                                              height: 70,
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/ui/currency.png',
                                                  width: 30,
                                                  height: 30,
                                                ),
                                                const SizedBox(width: 4),
                                                const Text(
                                                  '10.000',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                            ],
                          ),

                        )
                      ),
                      Expanded(flex: 1,
                        child: SizedBox.shrink()
                      ),
                    ],
                  )
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