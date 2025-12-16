import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'Config/Routes.dart';
import 'provider/quiz_database.dart';
import 'provider/quiz_provider.dart';
import 'service/app_state_provider.dart';
import 'service/audio_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Kunci orientasi layar
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await AppDatabase.instance.database;
  await RiveNative.init();

  runApp(const Tomath());
}

class Tomath extends StatelessWidget {
  const Tomath({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppStateProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => QuizProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AudioProvider(),
        )
      ],
      child: MaterialApp.router(
        title: 'Tomath',
        routerConfig: createRouter(),
      ),
    );
  }
}
