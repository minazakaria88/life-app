import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class ResumeWidget extends StatelessWidget {
  const ResumeWidget({
    super.key, required this.resumeUrl,

  });

  final String resumeUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 20),
      child: Row(
        children: [
          Text(
            S.of(context).view_resume,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.width,
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.cvScreen,arguments:resumeUrl);
            },
             icon: Image.asset(Assets.imagesCv,height: 40,width: 40,)
          ),
        ],
      ),
    );
  }
}
