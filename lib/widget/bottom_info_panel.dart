import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../service/app_state_provider.dart';
import 'woodbutton.dart';

class BottomInfoPanel extends StatefulWidget {
  const BottomInfoPanel({super.key});

  @override
  State<BottomInfoPanel> createState() => _BottomInfoPanelState();
}

class _BottomInfoPanelState extends State<BottomInfoPanel> {
  @override
  Widget build(BuildContext context) {
  final appState = Provider.of<AppStateProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 25),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Chapter:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              appState.bab,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 12),

            WoodButton(
              text: "Kembali",
              onTap: () {
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
