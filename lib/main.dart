import 'package:flutter/material.dart';
import 'package:tomath/Config/Routes.dart';

void main() {
  runApp(const Tomath());
}

class Tomath  extends StatelessWidget {
  const Tomath ({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tomath',

      routerConfig: createRouter(),
    );
  }
}








