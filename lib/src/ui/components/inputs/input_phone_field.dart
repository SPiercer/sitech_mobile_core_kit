import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPhoneField extends StatelessWidget {
  const InputPhoneField({
    required this.label,
    required this.hint,
    this.validator,
    super.key,
    required this.controller,
  });

  final String? Function(String? input)? validator;
  final String label;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: colors.outline)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          autofocus: true,
          validator: (value) {
            if (value!.isEmpty || !RegExp(r'^\+966\d{8}$').hasMatch(value)) {
              return 'Please enter a valid phone number';
            }
            return null;
          },
          maxLength: 9,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            counterText: '',
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                left: 15.0,
                right: 5.0,
              ),
              child: Text(
                '+966 │',
                style: TextStyle(fontSize: 16, color: colors.outline),
              ),
            ),
            contentPadding: const EdgeInsets.all(0),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.outlineVariant),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}
