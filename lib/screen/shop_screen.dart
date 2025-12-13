import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/app_state_provider.dart';
import '../widget/plank_info.dart';
import '../widget/item_card.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late final appState = Provider.of<AppStateProvider>(context, listen: true);

  int chosenContentId = 0;
  int chosenItemId = 0;
  int chosenItemCategory = 0;
  int cost = 0;

  List<Widget> asignItem(BuildContext context) {
    final _items = appState.shopItems;

    List<Widget> items = [];

    for(final item in _items!){
      if(item.is_purchased != 0) continue;

      late Widget element;

      if(item.item_category == 1){
        element = Text(item.name);
      }else if (item.item_category == 2){
        String itemSkin = item.name;
        element = Image.asset('assets/images/character/$itemSkin.png');
      }

      items.add(
        ItemCard(
          onTap: (){
            chosenItemId = item.item_id;
            chosenContentId = item.content_id;
            chosenItemCategory = item.item_category;
            cost = item.cost;
          },
          showCurrency: true,
          priceText: item.cost.toString(),
          child: element,
        ),
      );
    }

    return items;
  }

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
              child:
              PlankInfo(
                  backgroundImage: 'assets/ui/PapanKayuShortNew.png',

                  buttonWidth: 120,
                  buttonHeight: 50,

                  showLeftButton: false,

                  showRightButton: true,
                  rightButtonText: "Confirm",
                  rightButtonOnTap: () {
                    if(cost == 0) return;

                    if(appState.player.currency >= cost){
                      appState.updatePlayerCurrency(-(cost));

                      if(chosenItemCategory == 1){
                        appState.updateShopItem(chosenItemId ,chosenContentId, 1);
                      }else if(chosenItemCategory == 2){
                        appState.updateShopItem(chosenItemId, chosenContentId, 2);
                      }
                    }else{
                      print('ga ada duid');
                      return;
                    }

                    cost = 0;
                    print("barang kebeli");
                  },
                  rightButtonAlignment: Alignment.bottomRight,
                  rightButtonPadding: EdgeInsets.only(right: 70, bottom: 55),

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
                                Expanded(flex: 6,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ...asignItem(context),
                                      ],
                                    ),
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