import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String action;
  final VoidCallback onPressed;

  const SectionTitle({
    super.key,
    required this.title,
    required this.action,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(action),
        ),
      ],
    );
  }
}
