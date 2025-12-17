import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../service/app_state_provider.dart';
import '../service/audio_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final appState = Provider.of<AppStateProvider>(context, listen: true);
  late int dialogIndex = appState.currentDialogIndex;

  @override
  Widget build(BuildContext context) {
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
            Expanded(flex: 2,
              child: SizedBox.shrink(),
            ),
            Expanded(flex: 8,
              child: Container(
                margin: const EdgeInsets.only(right: 20.0, bottom: 30.0),
                alignment: Alignment.bottomRight,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: 200,
                  height: 150,
                  child: InkWell(
                    onTap: () async {
                      print('tombol Play ditekan');
                      if(dialogIndex == 5 || dialogIndex == 9 || dialogIndex == 19 ){
                        await context.push('/dialogue');
                      }else{
                        await context.push('/campaign');
                      }

                      context.read<AudioProvider>().playBgm(AppMusic.homeTheme);
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          'assets/ui/play_concept.png',
                          width: 200,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                        Text('Mulai', style: TextStyle(
                          fontFamily: 'LuckiestGuy',
                          fontSize: 30,
                          color: Color(0xFFF7EFD3),
                          shadows: [
                            Shadow(offset: Offset(2, 2), blurRadius: 0, color: Colors.black),
                            Shadow(offset: Offset(-2, -2), blurRadius: 0, color: Colors.black),
                            Shadow(offset: Offset(2, -2), blurRadius: 0, color: Colors.black),
                            Shadow(offset: Offset(-2, 2), blurRadius: 0, color: Colors.black),
                          ],
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 2,
              child: Container(

                // color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}