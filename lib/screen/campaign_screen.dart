import 'package:flutter/material.dart';

import '../widget/bottom_info_panel.dart';
import '../widget/level_map_area.dart';
import '../widget/level_popup.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  final List<bool> levelActive = [true, false, true, true];

  void _openPopup(int level) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (_) => LevelPopup(level: level),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8b882),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/LevelSelectionBG1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, c) {
            return Column(
              children: [
                const Spacer(flex: 8),

                /// AREA MAP LEVEL (Tengah)
                LevelMapArea(
                  constraints: c,
                  levelActive: levelActive,
                  onPressed: _openPopup,
                ),

                const Spacer(),

                /// BOTTOM PANEL
                const BottomInfoPanel(),
              ],
            );
          },
        ),
      ),
    );
  }
}
