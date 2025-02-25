import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/utils/app_colors.dart';
import 'package:life/generated/assets.dart';
import 'package:life/generated/l10n.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 90,
              width: double.infinity,
              color: AppColors.primaryColor,
              child: Column(
                children: [
                  55.height,
                  Center(
                      child: Text(
                    S.of(context).noInternetConnection,
                    style: const TextStyle(color: Colors.white),
                  )),
                ],
              ),
            ),
            100.height,
            SvgPicture.asset(
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
              Assets.imagesNoInternet,
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
            30.height,
            Center(
              child: Text(
                S.of(context).pleaseCheckYourInternetConnection,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
