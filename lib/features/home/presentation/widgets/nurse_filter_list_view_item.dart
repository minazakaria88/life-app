import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class NurseFilterListViewItem extends StatelessWidget {
  const NurseFilterListViewItem({
    super.key,
    required this.onTap,
    required this.id,
    required this.age,
    required this.name,
    required this.description,
    required this.image,
  });
  final Function onTap;
  final int id;
  final int age;
  final String name;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.grey,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Hero(
              tag: id,
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) => Image.asset(
                    Assets.imagesLoading,
                    fit: BoxFit.fill,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 90,
                  width: 90,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            10.width,
            Expanded(
              child: Column(
                children: [
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      5.width,
                      Text(
                        '$age ${S.of(context).year}',
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  10.height,
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
