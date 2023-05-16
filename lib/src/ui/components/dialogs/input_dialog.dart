import 'package:flutter/material.dart';
import 'package:sitech_mobile_core_kit/sitech_mobile_core_kit.dart';

class InputDialog extends StatelessWidget {
  const InputDialog({
    super.key,
    this.onYesPressed,
    this.onNoPressed,
    required this.title,
    this.content,
    required this.type,
  });
  final void Function()? onYesPressed;
  final void Function()? onNoPressed;
  final String title;
  final String? content;
  final InfoDialogType type;
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
      content:
          content == null ? null : Text(content!, textAlign: TextAlign.center),
      actions: [
        InputButton(
          width: double.infinity,
          onPressed: onYesPressed,
          child: const Text("Yes"),
        ),
        InputButton(
          width: double.infinity,
          onPressed: onNoPressed ?? () => Navigator.pop(context),
          filled: false,
          child: const Text("No"),
        ),
      ],
    );
  }
}
