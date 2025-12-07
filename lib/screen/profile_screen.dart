import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/app_state_provider.dart';

import '../widget/edit_image_popup.dart';
import '../widget/edit_name_popup.dart';
import '../widget/edit_title_popup.dart';
import '../widget/plank_info.dart';
import '../widget/rive_animation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isAttacking = false;

  void _triggerAttack() async {
    setState(() {
      _isAttacking = true; 
    });
    await Future.delayed(Duration(seconds: 1)); 
    setState(() {
      _isAttacking = false; 
    });
  }
  
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
                              SizedBox(
                                  height: 350,
                                  width: 350,
                                  child: CustomRIVEAnimation(
                                      artboardName: playerProfile.skin_path,
                                      isAttack: _isAttacking,
                                      isGetHit: false,
                                  )
                              ),

                              Positioned(
                                right: 10,
                                top: 40,
                                child: 
                                  ElevatedButton(onPressed: _triggerAttack, child: child)
                                  // EditImagePopup(),
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
