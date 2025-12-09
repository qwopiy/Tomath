import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/app_state_provider.dart';

class SettingButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const SettingButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => SettingPopup(
            buttonText: buttonText,
            onButtonPressed: onPressed,
          ),
        );
      },
      child: Image.asset(
        'assets/ui/UI_setting.png',
        width: MediaQuery.of(context).size.width * 0.17,
        height: MediaQuery.of(context).size.width * 0.17,
      ),
    );
  }
}

class SettingPopup extends StatefulWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;

  const SettingPopup({
    super.key,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  State<SettingPopup> createState() => _SettingPopupState();
}

class _SettingPopupState extends State<SettingPopup> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
        builder: (context, appState, child) {
          double soundVolume = appState.currentSoundVolume;
          double musicVolume = appState.currentMusicVolume;


          double screenWidth = MediaQuery.of(context).size.width;
          double popupWidth = screenWidth * 0.75;
          popupWidth = popupWidth < 280 ? 280 : popupWidth;
          return Center(
            child: Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  // POPUP BOX
                  Container(
                    width: popupWidth,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/ui/KertasGede.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),

                        Text(
                          "Setting",
                          style: TextStyle(
                            fontSize: popupWidth * 0.08,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // SOUND SLIDER
                        _volumeSlider(
                          label: "Sound",
                          value: soundVolume,
                          onChanged: (v) {
                            setState(() => soundVolume = v);
                          },
                          width: popupWidth,
                        ),

                        const SizedBox(height: 20),

                        // MUSIC SLIDER
                        _volumeSlider(
                          label: "Music",
                          value: musicVolume,
                          onChanged: (v) {
                            setState(() => musicVolume = v);
                          },
                          width: popupWidth,
                        ),

                        const SizedBox(height: 25),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: _button(
                              widget.buttonText,
                              widget.onButtonPressed,
                              popupWidth,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                ],
              ),
            ),

            // CLOSE BUTTON (X)
            Positioned(
              right: 10,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  appState.setVolume(soundVolume, musicVolume);
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.close,
                    size: popupWidth * 0.15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
        }
    );
  }


  Widget _volumeSlider({
    required String label,
    required double value,
    required Function(double) onChanged,
    required double width,
  }) {
    return Container(
      width: width * 0.85,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            activeColor: Colors.brown,
            inactiveColor: Colors.black,
            value: value,
            min: 0,
            max: 1,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}


Widget _button(String text, VoidCallback onTap, double width) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: width * 0.45,
      height: width * 0.15,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/ui/NavbarKayu.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: width * 0.06,
          color: Color(0xFFF7EFD3),
          fontWeight: FontWeight.bold,
          fontFamily: 'LuckiestGuy',
          shadows: [
            Shadow(offset: Offset(2, 2), blurRadius: 0, color: Colors.black),
            Shadow(offset: Offset(-2, -2), blurRadius: 0, color: Colors.black),
            Shadow(offset: Offset(2, -2), blurRadius: 0, color: Colors.black),
            Shadow(offset: Offset(-2, 2), blurRadius: 0, color: Colors.black),
          ],
        ),
      ),
    ),
  );
}
