import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/app_state_provider.dart';

class EditNamePopup extends StatelessWidget {
  const EditNamePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.transparent,
          useSafeArea: false,
          builder: (context) => const NamePopup(),
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

class NamePopup extends StatefulWidget {
  const NamePopup({super.key});

  @override
  State<NamePopup> createState() => _NamePopupState();
}

class _NamePopupState extends State<NamePopup> {

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
        builder: (context, appState, child) {
          final TextEditingController controller = TextEditingController();
          controller.text = appState.player.username;

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
                              Expanded(flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage('assets/ui/kertasPipih.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25) ,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'INPUT USERNAME',
                                      hintStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),

                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    controller: controller,
                                  ),
                                ),
                              ),
                              Expanded(flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _button("Back", () => Navigator.pop(context)),
                                      const SizedBox(width: 15),
                                      _button("Confirm", () {
                                        appState.setUsername(controller.text);
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



