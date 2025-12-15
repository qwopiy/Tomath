import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/app_state_provider.dart';
import 'item_card.dart';

class EditTitlePopup extends StatelessWidget {
  const EditTitlePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.transparent,
          useSafeArea: false,
          builder: (context) => const TitlePopup(),
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

class TitlePopup extends StatefulWidget {
  const TitlePopup({super.key});

  @override
  State<TitlePopup> createState() => _TitlePopupState();
}

class _TitlePopupState extends State<TitlePopup> {
  late final appState = Provider.of<AppStateProvider>(context, listen: true);

  late String currentTitle = appState.player.title_name;
  late String chosenTitleName = '';
  int chosenTitleId = 1;

  List<Widget> asignTitle(BuildContext context) {
    final _titles = appState.titles;

    List<Widget> titles = [];

    for(final title in _titles!){
      if(title.is_unlocked != 1) continue;

      titles.add(
        ItemCard(
          onTap: (){
            chosenTitleName = title.name;
            chosenTitleId = title.title_id;
            print('chosenTitleName: $chosenTitleName');
          },
          showCurrency: false,

          child: Align(
            alignment: Alignment.center,
            child: Text(
              title.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: "Baskerville",
              )
            ),
          ),

        ),
      );
    }

    return titles;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.50),
      // x: horizontal (-1 kiri, 1 kanan)
      // y: vertical (-1 atas, 1 bawah)

      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 0.4,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/ui/Mading_small.png'),
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
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ...asignTitle(context),
                              ],
                            ),
                          ),
                        ),
                        Expanded(flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _button("Kembali", () => Navigator.pop(context)),
                                const SizedBox(width: 15),
                                _button("Konfirmasi", (){
                                  if(currentTitle != chosenTitleName && chosenTitleName != ''){
                                    appState.setPlayerTitle(chosenTitleName, chosenTitleId);
                                  }
                                  Navigator.pop(context);

                                }),
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

