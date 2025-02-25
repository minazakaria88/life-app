import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: AppColors.primaryColor,
              ),
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            30.height,
          ],
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
          child: SvgPicture.asset(
            Assets.drawerUser,
            height: 80.0,
            width: 80.0,
            fit: BoxFit.fill,
            colorFilter: const ColorFilter.mode(
              // Colors.indigo,
              Color(0xff972211),
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
