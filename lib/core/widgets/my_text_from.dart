import 'package:flutter/material.dart';
import 'package:life/core/utils/app_colors.dart';

class MyTextForm extends StatelessWidget {
  const MyTextForm({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.keyboardType,
    this.enabled = true,
    this.maxLines,
  });
  final String label;
  final TextEditingController controller;
  final Function validator;
  final Widget prefixIcon;
  final bool enabled;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        keyboardType: keyboardType,
        obscureText: obscureText,
        enabled: enabled,
        controller: controller,
        style: const TextStyle(
          color: AppColors.primaryColor,
        ),
        cursorColor: AppColors.primaryColor,
        validator: (value) => validator(value),
        decoration: InputDecoration(
          fillColor: Colors.grey.shade300,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintText: label,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
