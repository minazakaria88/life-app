import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../core/functions/get_language.dart';
import '../../../../core/utils/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: getLanguage() == 'ar' ? 20 : null,
      left: getLanguage() == 'en' ? 20 : null,
      child: InkWell(
        onTap: () {
          context.pop();
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
