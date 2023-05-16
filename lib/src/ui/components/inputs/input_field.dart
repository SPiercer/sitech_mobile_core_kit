import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    required this.label,
    required this.hint,
    this.validator,
    super.key,
    required this.controller,
    this.obscureText = false,
  });

  final String? Function(String? input)? validator;
  final String label;
  final String hint;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: theme.outline)),
        const SizedBox(height: 6),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          autofocus: true,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: theme.outlineVariant),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}
