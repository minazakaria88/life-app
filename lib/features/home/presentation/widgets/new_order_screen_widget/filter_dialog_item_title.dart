import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../../core/utils/app_colors.dart';
class FilterDialogItemTitle extends StatelessWidget {
  const FilterDialogItemTitle({
    super.key, required this.title, required this.image,
  });
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(
           image,
            height: 25.0,
            width: 25.0,
            color: AppColors.primaryColor,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          10.width,
          Text(
            title,
            style: const TextStyle(
              color: AppColors.greyDeep,
            ),
          ),
        ],
      ),
    );
  }
}