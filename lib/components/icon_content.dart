import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: Column(
      children: [
        Icon(icon, size: 44),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    ),
  );
}
