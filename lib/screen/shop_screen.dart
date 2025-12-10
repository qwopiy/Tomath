import 'package:flutter/material.dart';

import '../widget/plank_info.dart';
import '../widget/item_card.dart';

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
              child: SizedBox.shrink(),
            ),
            Expanded(flex: 4,
              child: SizedBox.shrink(),
            ),
            Expanded(flex: 4,
                child: PlankInfo(
                  backgroundImage: 'assets/ui/PapanKayuShortNew.png',

                  buttonWidth: 150,
                  buttonHeight: 50,

                  showLeftButton: false,

                  showRightButton: true,
                  rightButtonText: "Confirm",
                  rightButtonOnTap: () {
                    print("Confirm Button");
                  },
                  rightButtonAlignment: Alignment.bottomRight,
                  rightButtonPadding: EdgeInsets.only(right: 70, bottom: 55),

                  child: Column(
                    children: [
                      Expanded(flex: 2,
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(flex: 1,
                                child: Container(),
                              ),
                              Expanded(flex: 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ItemCard(
                                      showCurrency: false,
                                      priceText: "20.000",
                                      onTap: () {
                                        print("1");
                                      },
                                      child: Image.asset('assets/ui/Home1.png'),

                                    ),
                                    ItemCard(
                                      showCurrency: false,
                                      priceText: "30.000",
                                      onTap: () {
                                        print("2");
                                      },
                                      child: Image.asset('assets/ui/Home1.png'),

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