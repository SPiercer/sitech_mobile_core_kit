import 'package:flutter/material.dart';

class RBackButton extends StatelessWidget {
  const RBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        color: theme.primary,
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new),
        style: IconButton.styleFrom(
          backgroundColor: theme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
            side: BorderSide(color: theme.onTertiary),
          ),
        ),
      ),
    );
  }
}
