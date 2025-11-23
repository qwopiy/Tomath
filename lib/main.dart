import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomath/provider/quiz_provider.dart';

import 'Config/Routes.dart';
// import 'package:tomath/Config/Routes.dart';

void main() {
  runApp(const Tomath());
}

class Tomath  extends StatelessWidget {
  const Tomath ({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuizProvider(),
        )
      ],
      child: MaterialApp.router(
        title: 'Tomath',

        routerConfig: createRouter(),
      ),
    );
  }
}