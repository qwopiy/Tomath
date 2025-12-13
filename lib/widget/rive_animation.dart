import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CustomRIVEAnimation extends StatefulWidget {
  final bool isAttack;
  final bool isGetHit;
  final String artboardName;

  const CustomRIVEAnimation({super.key, required this.artboardName, required this.isAttack, required this.isGetHit});

  @override
  State<CustomRIVEAnimation> createState() => _CustomRIVEAnimationState();
}

class _CustomRIVEAnimationState extends State<CustomRIVEAnimation> {
  late File file;
  late RiveWidgetController controller;

  Duration attackAnimationDuration = Duration(seconds: 1);
  Duration getHitAnimationDuration = Duration(milliseconds: 4);

  BooleanInput? _isAttack;
  BooleanInput? _isGetHit;

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

      _isAttack = controller.stateMachine.boolean('isAttack');
      _isAttack?.value = false;

      _isGetHit = controller.stateMachine.boolean('isGetHit');
      _isGetHit?.value = false;


    setState(() => isInitialized = true);
  }

  @override
  void dispose() {
    _isAttack?.dispose();
    _isGetHit?.dispose();
    file.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomRIVEAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAttack != oldWidget.isAttack) {
      _isAttack?.value = widget.isAttack;
    }
    if (widget.isGetHit != oldWidget.isGetHit) {
      _isGetHit?.value = widget.isGetHit;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return RiveWidget(
      controller: controller,
      fit: Fit.fill,
    );
  }
}