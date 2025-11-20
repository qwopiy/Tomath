import 'package:flutter/material.dart';

class TaskBar extends StatelessWidget {
  const TaskBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
            children: [
              Image.asset("assets/images/FreakyBug.png",
              fit: BoxFit.cover),
              Text(
                "freaky Bug",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                )
              )
            ],
          ),
      ],
    );
  }
}
