import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ValidatedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final ValueNotifier<bool> isFocused;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final String? hintText;
  final String? helperText;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const ValidatedTextField({
    required this.controller,
    required this.label,
    required this.isFocused,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines,
    this.hintText,
    this.helperText,
    this.validator,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isFocused,
      builder: (context, focused, _) {
        return Focus(
          onFocusChange: (value) => isFocused.value = value,
          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              helperText: helperText,
              helperMaxLines: 2,
              labelStyle: TextStyle(color: Colors.grey[600]),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: maxLines != null ? 20 : 15,
                horizontal: 16,
              ),
            ),
            validator: validator,
            onTap: onTap,
          ),
        );
      },
    );
  }
}