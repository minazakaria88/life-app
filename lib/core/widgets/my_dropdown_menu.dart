import 'package:flutter/material.dart';
import 'package:life/core/utils/app_colors.dart';

class MyDropDownMenu extends StatelessWidget {
  const MyDropDownMenu({
    super.key,
    required this.initialValue,
    required this.label,
    required this.onSelected,
    required this.dropdownMenuEntries,
    this.menuHeight,
    this.maxHeight = 45,
    this.width,
  });
  final int initialValue;
  final String label;
  final Function onSelected;
  final double? menuHeight;
  final double maxHeight;
  final double? width;
  final List<DropdownMenuEntry> dropdownMenuEntries;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      menuHeight: menuHeight,
      inputDecorationTheme: InputDecorationTheme(
        iconColor: Colors.green,
        constraints: BoxConstraints(maxHeight: maxHeight),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      width: width ?? MediaQuery.sizeOf(context).width * 0.6,
      initialSelection: initialValue,
      errorText: const InputDecoration().errorText,
      label: Text(label),
      onSelected: (value) {
        onSelected(value);
      },
      dropdownMenuEntries: dropdownMenuEntries,
    );
  }
}
