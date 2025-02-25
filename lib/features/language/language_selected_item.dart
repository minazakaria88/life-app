import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../core/functions/get_language.dart';
import '../../core/utils/app_colors.dart';

class LanguageSelectedItem extends StatelessWidget {
  const LanguageSelectedItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.image, required this.lang,
  });

  final Function onTap;
  final String title;
  final String image;
  final String lang;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: getLanguage() == lang ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        margin: const EdgeInsets.all(10),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            image,
            height: 40,
            width: 40,
          ),
          20.width,
          Text(
            title,
            style: TextStyle(
              color: getLanguage() == lang ? Colors.white : Colors.black,
            ),
          ),
          20.width,
          if (getLanguage() == lang)
            const Icon(
              Icons.check,
              color: Colors.white,
              size: 20,
            )
        ]),
      ),
    );
  }
}
