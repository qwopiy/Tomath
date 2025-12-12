import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback? onTap;

  const LevelButton({
    super.key,
    required this.enabled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: enabled ? Colors.white : Colors.grey.shade500,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
