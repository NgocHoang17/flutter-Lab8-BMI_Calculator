import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) => IconButton.filledTonal(
    tooltip: label,
    onPressed: onPressed,
    icon: Icon(icon),
    style: IconButton.styleFrom(
      minimumSize: const Size(44, 44),
      maximumSize: const Size(44, 44),
    ),
  );
}
