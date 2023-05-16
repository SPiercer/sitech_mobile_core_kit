import 'package:flutter/material.dart';

import '../inputs/input_button.dart';

enum InfoDialogType { info, error, success }

class InfoDialog extends StatelessWidget {
  final String title;
  final String content;
  final InfoDialogType type;
  final void Function()? onPressed;
  const InfoDialog({
    super.key,
    required this.title,
    required this.content,
    required this.type,
    this.onPressed,
  });

  Future<void> show(BuildContext context) async => await showGeneralDialog(
        context: context,
        transitionDuration: const Duration(milliseconds: 350),
        pageBuilder: (_, __, ___) => this,
        transitionBuilder: (_, a1, __, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          return Transform.scale(scale: curve, child: child);
        },
      );

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AlertDialog(
      backgroundColor: colors.surface,
      title: Center(
        child: Column(
          children: [
            Icon(
              type == InfoDialogType.info
                  ? Icons.info_outline
                  : type == InfoDialogType.error
                      ? Icons.error_outline
                      : Icons.check_circle_outline,
              color: type == InfoDialogType.info
                  ? colors.primary
                  : type == InfoDialogType.error
                      ? colors.error
                      : colors.primary,
              size: 40,
            ),
            const SizedBox(height: 8),
            FittedBox(child: Text(title)),
          ],
        ),
      ),
      content: Text(content, textAlign: TextAlign.center),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actions: [
        InputButton(
          width: double.infinity,
          onPressed: onPressed ?? () => Navigator.pop(context),
          child: const Text('OK'),
        )
      ],
    );
  }
}
