import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/audio_provider.dart';
import '../widget/bottom_info_panel.dart';
import '../widget/level_map_area.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AudioProvider>().playBgm(AppMusic.gameTheme);
    });
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
            alignment: Alignment(0.5, 0.7),

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
