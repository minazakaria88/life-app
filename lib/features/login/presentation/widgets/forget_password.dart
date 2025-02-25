import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          context.pushNamed(Routes.forgetPassword);
        },
        child: Text(
          S.of(context).forgetPassword,
          style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}