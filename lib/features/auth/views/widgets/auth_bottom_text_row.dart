import 'package:flutter/material.dart';

class AuthBottomTextRow extends StatelessWidget {
  final String label;
  final String actionText;
  final VoidCallback onPressed;

  const AuthBottomTextRow({
    super.key,
    required this.label,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}
