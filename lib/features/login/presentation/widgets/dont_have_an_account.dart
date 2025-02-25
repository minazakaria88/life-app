import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).dontHaveAnAccount),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.register);
          },
          child: Text(
            S.of(context).signUp,
            style: const TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
