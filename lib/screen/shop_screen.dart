import 'package:flutter/material.dart';
import '../widget/plank_info.dart';
import '../widget/item_card.dart';
import '../service/app_state_provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
            const Spacer(flex: 2),
            const Spacer(flex: 4),
            Expanded(
              flex: 5,
              child: PlankInfo(
                backgroundImage: 'assets/ui/Mading_small.png',

                buttonWidth: size.width * 0.35,
                buttonHeight: size.height * 0.06,

                showLeftButton: false,
                showRightButton: true,
                rightButtonText: "Konfirmasi",
                rightButtonOnTap: () {
                  print("Confirm Button");
                },
                rightButtonAlignment: Alignment.bottomRight,
                rightButtonPadding: EdgeInsets.only(
                  right: size.width * 0.2,
                  bottom: size.height * 0.05,
                ),

                //isi papan
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.145,
                    vertical: size.height * 0.10,
                  ),
                  child: GridView(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.01,
                    ),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 50,
                      // childAspectRatio: 10 / 5 ,
                    ),
                    children:[
                      ItemCard(
                          showCurrency: true,
                          priceText: "20.000",
                          onTap: () {
                            print("1");
                          },
                          child: Image.asset(
                            'assets/ui/FreakyBugLogo.png',
                            fit: BoxFit.contain,
                          )
                      ),
                      ItemCard(
                        showCurrency: true,
                        priceText: "20.000",
                        onTap: () {
                          print("1");
                        },
                        child: Image.asset(
                          'assets/ui/Home1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      ItemCard(
                        showCurrency: true,
                        priceText: "20.000",
                        onTap: () {
                          print("1");
                        },
                        child: Image.asset(
                          'assets/ui/Home1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      ItemCard(
                        showCurrency: true,
                        priceText: "20.000",
                        onTap: () {
                          print("1");
                        },
                        child: Image.asset(
                          'assets/ui/Home1.png',
                          fit: BoxFit.contain,
                        ),
                      ),


                    ],
                  )
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
