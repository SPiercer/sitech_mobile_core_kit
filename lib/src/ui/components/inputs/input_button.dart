import 'package:flutter/material.dart';

class InputButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final void Function()? onPressed;
  final bool filled;
  const InputButton({
    super.key,
    required this.child,
    this.width,
    this.onPressed,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      child: FilledButton.tonal(
        style: FilledButton.styleFrom(
          backgroundColor: !filled ? Colors.transparent : colors.tertiary,
          foregroundColor: filled ? colors.onTertiary : colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: !filled
                ? BorderSide(width: 1, color: colors.primary)
                : BorderSide.none,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
