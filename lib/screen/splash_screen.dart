import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../service/app_state_provider.dart';
import '../service/audio_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _logoController;
  late Animation<double> _logoAnimation;

  bool showLogo = false;
  bool showLoadingScreen = false;

  Future<void> _initializeApplication() async {
    final appState = context.read<AppStateProvider>();
    final audio = context.read<AudioProvider>();

    await Future.wait([
      appState.initializeFuture,
      Future.delayed(Duration(seconds: 2)),
    ]);

    audio.playBgm(AppMusic.homeTheme);

    if (mounted) {
      if(appState.currentDialogIndex > 0){
        context.go('/home');
      }else{
        context.go('/dialogue');
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeInOut,
    );

    _startSplashSequence();
  }

  Future<void> _startSplashSequence() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() => showLogo = true);
    _logoController.forward();

    await Future.delayed(const Duration(seconds: 3));

    _logoController.reverse();
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      showLogo = false;
      showLoadingScreen = true;
    });
    _initializeApplication();
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [

          //Background
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.black, // fallback selalu hitam
              image: showLoadingScreen ? const DecorationImage(
                image: AssetImage('assets/background/LoadingScreen.png'),
                fit: BoxFit.cover,
              )
                  : null,
            ),
          ),

          //Logo
          if (showLogo)
            Center(
              child: FadeTransition(
                opacity: _logoAnimation,
                child: Image.asset(
                  'assets/ui/FreakyBugLogo.png',
                  width: size.width * 1,
                  height: size.width * 1,
                ),
              ),
            ),

          //Loading
          if (showLoadingScreen)
            Positioned(
              bottom: size.height * 0.06,
              left: size.width * 0.5,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: size.width * 0.06,
                    height: size.width * 0.06,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(width: size.width * 0.03),

                  Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w500,
                      fontFamily: "LuckiestGuy",
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
