import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../../core/utils/app_colors.dart';
import 'contract_card_column.dart';

class ContractDetailsCard extends StatelessWidget {
  const ContractDetailsCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.value1,
    required this.value2,
    required this.value3,
  });
  final String title;
  final String subTitle;
  final String label1;
  final String label2;
  final String label3;
  final String value1;
  final String value2;
  final String value3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Card.outlined(
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.myRed,
                      ),
                      child: Text(
                        subTitle,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Center(
                        child: ContractCardColumn(
                          title: label1,
                          value: value1,
                        ),
                      ),
                    ),
                    Flexible(
                      child: ContractCardColumn(
                        title: label2,
                        value: value2,
                      ),
                    ),
                    Flexible(
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
