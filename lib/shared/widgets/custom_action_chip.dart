import 'package:flutter/material.dart';

class CustomActionChip extends StatelessWidget {
  const CustomActionChip({
    super.key,
    required this.labelText,
    required this.onPressed,
  });

  final String labelText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ActionChip(
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: WidgetStateColor.resolveWith(
          (states) => colorScheme.surfaceContainerHighest,
        ),
        avatar: Icon(
          Icons.expand_more,
          color: colorScheme.onSurface,
        ),
        label: Text(
          labelText,
          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
