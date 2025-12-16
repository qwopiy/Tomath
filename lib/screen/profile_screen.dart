import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/app_state_provider.dart';
import '../widget/edit_image_popup.dart';
import '../widget/edit_name_popup.dart';
import '../widget/edit_title_popup.dart';
import '../widget/plank_info.dart';
import '../widget/rive_animation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;

    ///RESPONSIVE VALUE (CLAMPED)
    final profileImage = (size.width * 0.6).clamp(220.0, 360.0);
    final contentWidth = (size.width * 0.7).clamp(260.0, 420.0);
    final nameFontSize = (size.width * 0.045).clamp(16.0, 22.0);
    final titleFontSize = (size.width * 0.045).clamp(16.0, 22.0);

    final editIconRight =
    isTablet ? 0.0 : size.width * -0.05; // aman di tablet

    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        final playerProfile = appState.player;
        final playerSkin = playerProfile.skin_path;

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

                ///main
                Expanded(
                  flex: 8,
                  child: PlankInfo(
                    showLeftButton: false,
                    showRightButton: false,
                    backgroundImage: 'assets/ui/kertas_small.png',
                    child: Column(
                      children: [
                        ///profileImage
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: profileImage,
                              height: profileImage,
                              child: Image.asset(
                                'assets/images/character/$playerSkin.png',
                                fit: BoxFit.contain,
                              ),
                            ),

                            Positioned(
                              right: editIconRight,
                              top: profileImage * 0.15,
                              child: const EditImagePopup(),
                            ),
                          ],
                        ),

                        SizedBox(height: size.height * 0.01),

                        ///Username
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  playerProfile.username,
                                  style: TextStyle(
                                    fontSize: nameFontSize,
                                    color: Colors.black,
                                    fontFamily: 'LuckiestGuy',
                                  ),
                                ),

                                SizedBox(height: size.height * 0.01),

                                Container(
                                  width: contentWidth,
                                  height: 2,
                                  color: Colors.black,
                                ),
                              ],
                            ),

                            const Positioned(
                              right: 0,
                              child: EditNamePopup(),
                            ),
                          ],
                        ),

                        SizedBox(height: size.height * 0.015),

                        ///title
                        SizedBox(
                          width: contentWidth,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                playerProfile.title_name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: titleFontSize,
                                  color: Colors.black,
                                  fontFamily: 'LuckiestGuy',
                                ),
                              ),

                              const Positioned(
                                right: 0,
                                child: EditTitlePopup(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(flex: 2),
              ],
            ),
          ),
        );
      },
    );
  }
}