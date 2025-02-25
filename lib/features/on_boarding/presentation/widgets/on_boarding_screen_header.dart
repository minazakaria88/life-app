import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';

class OnBoardingScreenHeader extends StatelessWidget {
  const OnBoardingScreenHeader({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Welcome to Life",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                context.pushNamedAndRemoveUntil(Routes.login, (c) => false);
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
