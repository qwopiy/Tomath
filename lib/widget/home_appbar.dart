import 'package:flutter/material.dart';

import 'package:tomath/widget/currency_bar.dart';
import 'package:tomath/widget/setting_button.dart';

class HomeAppbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        bottom: false,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(flex: 1,
            child: Container(
              // alignment: AlignmentGeometry.topLeft,
              child: CurrencyBar(
                backgroundImage: 'assets/ui/kertasPipihPol.png',
                currencyIcon: 'assets/ui/currency.png',
                amount: 999999,
              ),
            ),
          ),
          Expanded(flex: 1,
              child: Container(
                alignment: AlignmentGeometry.topRight,
                // color: Colors.green,
                // child: Text('tes'),
                child: SettingButton(
                  buttonText: 'Exit',
                  onPressed: (){},
                ),
              )
          )
        ],
            ),
      );
  }
}