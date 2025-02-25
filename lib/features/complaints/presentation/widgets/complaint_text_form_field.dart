import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class ComplaintsTextFormField extends StatelessWidget {
  const ComplaintsTextFormField({
    super.key,  this.maxLines, required this.controller, required this.validation,
  });
  final int ? maxLines ;
  final TextEditingController controller;
  final Function validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_)=>FocusManager.instance.primaryFocus?.unfocus(),
      maxLines: maxLines,
      controller: controller,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.start,
      validator: (value) {
        return validation(value);
      },
      decoration: InputDecoration(
        suffixStyle: const TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.grey.shade300,
        filled: true,
        hintText: S.of(context).ticket_name,
        hintStyle: const TextStyle(
          color: AppColors.greyDeep,
          fontSize: 14,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}