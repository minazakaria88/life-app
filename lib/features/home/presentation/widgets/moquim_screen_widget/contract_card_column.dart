import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../../core/utils/app_colors.dart';

class ContractCardColumn extends StatelessWidget {
  const ContractCardColumn({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
        ),
        5.height,
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
