import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.child,
    this.onTap,
    this.selected = false,
  });
  final Widget child;
  final VoidCallback? onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.zero,
    color: selected ? const Color(0xFF393048) : const Color(0xFF1D2237),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22),
      side: BorderSide(
        color: selected ? const Color(0xFFF18C9A) : Colors.transparent,
        width: 2,
      ),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    ),
  );
}
