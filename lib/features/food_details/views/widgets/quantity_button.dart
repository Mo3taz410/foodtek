import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const QuantityButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(icon, color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
    );
  }
}
