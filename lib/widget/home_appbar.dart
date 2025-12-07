import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'currency_bar.dart';
import 'setting_button.dart';

import '../service/app_state_provider.dart';

class HomeAppbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Consumer<AppStateProvider>(
        builder: (context, appState, child) {
          final playerProfile = appState.player;

          return SafeArea(
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
                      amount: playerProfile.currency,
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
                ),
              ]
            ),
          );
        }
      );
  }
}