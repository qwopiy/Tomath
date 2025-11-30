import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CustomRIVEAnimation extends StatefulWidget {
  final String artboardName;

  const CustomRIVEAnimation({super.key, required this.artboardName});

  @override
  State<CustomRIVEAnimation> createState() => _CustomRIVEAnimationState();
}

class _CustomRIVEAnimationState extends State<CustomRIVEAnimation> {
  late File file;
  late RiveWidgetController controller;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    initRive();
  }

  void initRive() async {
    file = (await File.asset("assets/animations/tomath.riv", riveFactory: Factory.rive))!;

    controller = RiveWidgetController(
      file,
      artboardSelector: ArtboardSelector.byName(widget.artboardName),
      stateMachineSelector: StateMachineSelector.byName('State Machine 1'),
    );
    setState(() => isInitialized = true);
  }

  @override
  void dispose() {
    file.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return RiveWidget(
      controller: controller,
      fit: Fit.contain,
    );
  }
}