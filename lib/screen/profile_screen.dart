import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/app_state_provider.dart';
import 'package:tomath/widget/edit_image_popup.dart';
import 'package:tomath/widget/edit_name_popup.dart';
import 'package:tomath/widget/edit_title_popup.dart';
import 'package:tomath/widget/plank_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
        builder: (context, appState, child) {
          final playerProfile = appState.player;

          return Scaffold(
            backgroundColor: const Color(0xffe8b882),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background/HomeBG.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const Spacer(flex: 2),

                  Expanded(
                    flex: 8,
                    child: PlankInfo(
                      showLeftButton: false,
                      showRightButton: false,
                      backgroundImage: 'assets/ui/KertasGede.png',
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                "assets/ui/Home.png",
                                width: MediaQuery.of(context).size.width * 1,
                                height: MediaQuery.of(context).size.height * 0.4,
                                fit: BoxFit.fitHeight,
                              ),

                              Positioned(
                                right: 10,
                                top: 40,
                                child: EditImagePopup(),
                              )
                            ],
                          ),

                          const SizedBox(height: 20),

                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    playerProfile.username, //username
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 2,
                                    width: 320,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 2,
                                            color: Colors.black,
                                            style: BorderStyle.solid),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 0,
                                child: EditNamePopup(),
                              )
                            ],
                          ),

                          const SizedBox(height: 10),

                          Container(
                            width: 320,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  playerProfile.title_name, //title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),

                                Positioned(
                                  right: 0,
                                  child: EditTitlePopup(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          );
        }
    );
  }
}
