import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 15),
      child: RichText(
          text: TextSpan(
            text: S.of(context).by_clicking_on_create,
            style: const TextStyle(color: Colors.black),
            children: [
              const TextSpan(text: '  '),
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () {},
                text: S.of(context).terms_and_conditions,
                style:
                const TextStyle(color: AppColors.primaryColor),
              ),
            ],
          )),
    );
  }
}
