import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomath/widget/item_card.dart';

import '../service/app_state_provider.dart';
import 'rive_animation.dart';

class EditImagePopup extends StatelessWidget {
  const EditImagePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.transparent,
          useSafeArea: false,
          builder: (context) => const ImagePopup(),
        );
      },
      child: Image.asset(
        'assets/ui/PenIcon.png',
        width: 100,
        height: 100,
      ),
    );
  }
}

class ImagePopup extends StatefulWidget {
  const ImagePopup({super.key});

  @override
  State<ImagePopup> createState() => _ImagePopupState();
}

class _ImagePopupState extends State<ImagePopup> {
  late final appState = Provider.of<AppStateProvider>(context, listen: true);

  late String currentSkin = appState.player.skin_path;
  late String chosenSkinName = '';
  int chosenSkinId = 1;

  List<Widget> asignSkin(BuildContext context) {
    final _skins = appState.skins;

    List<Widget> skins = [];

    for(final skin in _skins!){
      if(skin.is_unlocked != 1) continue;

      String skinPath = skin.path;

      skins.add(
        ItemCard(
          onTap: (){
            chosenSkinName = skin.path;
            chosenSkinId = skin.skin_id;
            print('chosenSkinName: $chosenSkinName');
          },
          showCurrency: false,
          child: Image.asset('assets/images/character/$skinPath.png'),
        ),
      );
    }

    return skins;
  }


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.50),
      // x: horizontal (-1 kiri, 1 kanan)
      // y: vertical (-1 atas, 1 bawah)

      child: FractionallySizedBox(
        widthFactor: 1.2,
        heightFactor: 0.4,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/ui/PapanKayuShort.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              children: [
                Expanded(flex: 1,
                    child: Container(
                      // color: Colors.cyan
                    )
                ),
                Expanded(flex: 4,
                    child: Column(
                      children: [
                        Expanded(flex: 1,
                            child: Container(
                              // color: Colors.red
                            )
                        ),
                        Expanded(flex: 6,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ...asignSkin(context),
                              ]
                          ),
                        ),
                        Expanded(flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _button("Back", () => Navigator.pop(context)),
                                const SizedBox(width: 15),
                                _button("Confirm", (){
                                  if(currentSkin != chosenSkinName && chosenSkinName != ''){
                                    appState.setPlayerSkin(chosenSkinName, chosenSkinId);
                                  }
                                  Navigator.pop(context);}),
                              ],
                            )
                        ),
                      ],
                      // color: Colors.green
                    )
                ),
                Expanded(flex: 1,
                    child: Container(
                      // color: Colors.red
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 45,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/ui/NavbarKayu.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



