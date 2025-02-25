import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class OrderSuccessWidget extends StatelessWidget {
  const OrderSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(Icons.check, color: AppColors.primaryColor, size: 50),
      ],
    );
  }
}
