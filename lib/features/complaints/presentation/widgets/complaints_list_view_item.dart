import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/generated/l10n.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../home/presentation/widgets/moquim_screen_widget/contract_card_column.dart';

class ComplaintsListViewItem extends StatelessWidget {
  const ComplaintsListViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.note,
    required this.image, this.color,
  });

  final String title;
  final String subTitle;
  final String label1;
  final String label2;
  final String label3;
  final String value1;
  final String value2;
  final String value3;
  final String note;
  final String image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Card(
        elevation: 8,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    10.width,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: color //AppColors.greyDeep,
                          ),
                      child: Text(
                        subTitle,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              // Divider
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),

              // Row for labels and values
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContractCardColumn(
                    title: label1,
                    value: value1,
                  ),
                  ContractCardColumn(
                    title: label2,
                    value: value2,
                  ),
                  ContractCardColumn(
                    title: label3,
                    value: value3,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
              Row(
                children: [
                  Text(
                    '${S.of(context).details} : ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
                      child: Text(
                        note,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              if(image!='https://kdamat.com')
              CachedNetworkImage(
                height: 100,
                width: double.infinity,
                imageUrl: image,
                fit: BoxFit.fill,
                placeholder: (context, url) => Image.asset(Assets.imagesLoading),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
