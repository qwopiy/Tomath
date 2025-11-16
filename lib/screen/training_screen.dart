import 'package:flutter/material.dart';
import '../widget/currency_bar.dart';
import '../widget/plank_info.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/TrainingBG.png'),
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
            Flexible(flex: 4,
              child: PlankInfo(
                // height: 00,
                buttonText: "Confirm",
                backgroundImage: 'assets/ui/PapanKayuShort.png',

              ),
            ),
            Flexible(flex: 2,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      )
    );
  }
}
