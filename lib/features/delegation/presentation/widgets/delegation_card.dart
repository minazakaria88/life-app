import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life/core/helpers/extensions.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../home/presentation/widgets/moquim_screen_widget/contract_card_column.dart';

class DataShowCard extends StatelessWidget {
  const DataShowCard(
      {super.key,
      required this.title,
      required this.label1,
      required this.label2,
      required this.label3,
      required this.value1,
      required this.value2,
      required this.value3,
      required this.remove,
      required this.edit,
      this.isEdit = true});
  final String title;
  final String label1;
  final String label2;
  final String label3;
  final String value1;
  final String value2;
  final String value3;
  final Function remove;
  final Function edit;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    10.width,
                    if (isEdit)
                      IconButton(
                        onPressed: () {
                          edit();
                        },
                        icon: SvgPicture.asset(
                          Assets.imagesPencil,
                          height: 20,
                          width: 20,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    IconButton(
                      onPressed: () {
                        remove();
                      },
                      icon: SvgPicture.asset(
                        Assets.imagesRemove,
                        height: 20,
                        width: 20,
                        colorFilter:
                            const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ContractCardColumn(
                        title: label1,
                        value: value1,
                      ),
                    ),
                    Expanded(
                      child: ContractCardColumn(
                        title: label2,
                        value: value2,
                      ),
                    ),
                    Expanded(
                      child: ContractCardColumn(
                        title: label3,
                        value: value3,
                      ),
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
