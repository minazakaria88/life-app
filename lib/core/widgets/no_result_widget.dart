import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../generated/assets.dart';
import '../../generated/l10n.dart';
import '../utils/app_colors.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        50.height,
        SvgPicture.asset(
          Assets.imagesNoResult,
          height: 100,
          width: 100,
          colorFilter: const ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        Center(
          child: Text(
            S.of(context).there_are_no_results,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
