import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'Config/Routes.dart';
import 'package:provider/provider.dart';
import 'service/app_state_provider.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tomath',

      // CampaignScreen();
      routerConfig: createRouter(),
    );
  }
}
