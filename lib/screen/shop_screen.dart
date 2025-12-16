import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/app_state_provider.dart';
import '../widget/plank_info.dart';
import '../widget/item_card.dart';
import '../service/app_state_provider.dart';

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
        element = Text(
          item.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'LuckiestGuy',
          ),
        );
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
                    print("Confirm Button");
                    cost = 0;
                    print("barang kebeli");
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
                    ),
                    children:[
                      ...asignItem(context),
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
