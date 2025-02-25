import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/utils/app_colors.dart';

class ContractDetailsItem extends StatelessWidget {
  const ContractDetailsItem({
    super.key,
    required this.image,
    required this.title,
    required this.value,
  });
  final String image;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color:  AppColors.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: SvgPicture.asset(
                    image,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              20.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16),
                    ),
                    5.height,
                    Text(
                      value,
                      style:  const TextStyle(color: AppColors.primaryColor,fontWeight:FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Fontweight {
}
