import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:tomath/provider/app_database.dart';
import 'package:tomath/provider/quiz_provider.dart';

import 'Config/Routes.dart';
import 'service/app_state_provider.dart';
// import 'package:tomath/Config/Routes.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await AppDatabase.instance.database;
//   // await AppDatabase.instance.getRandomQuestion();
//   // await AppDatabase.instance.testInsert();
//   // await AppDatabase.instance.deleteDB();
//
//
//   runApp(const Tomath());
// }


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.instance.database;
  await RiveNative.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppStateProvider(),
      child: const Tomath(),
    ),
  );
}

class Tomath  extends StatelessWidget {
  const Tomath ({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuizProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Tomath',

      // CampaignScreen();
      routerConfig: createRouter(),
    );
  }
