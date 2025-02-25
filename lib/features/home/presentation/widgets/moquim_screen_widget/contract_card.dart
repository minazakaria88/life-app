import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/home/data/models/parse_contract_status.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import 'contract_card_column.dart';

class ContractCard extends StatelessWidget {
  const ContractCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.duration,
    this.price,
    this.tax,
    required this.status,
  });
  final Function onTap;
  final String title;
  final int duration;
  final dynamic price;
  final dynamic tax;
  final String status;

  @override
  Widget build(BuildContext context) {

    final model = parseStatus(status, context);
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: model?.color //AppColors.greyDeep,
                          ),
                      child: Text(
                        model!.status,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: ContractCardColumn(
                        title: S.of(context).duration,
                        value: '$duration ${S.of(context).month}',
                      ),
                    ),
                    Flexible(
                      child: ContractCardColumn(
                        title: S.of(context).price,
                        value: '$price ${S.of(context).sar}',
                      ),
                    ),
                    Flexible(
                      child: ContractCardColumn(
                        title: S.of(context).tax,
                        value: '$tax',
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

  ContractStatusModel? parseStatus(String status, BuildContext context) {
    //status close  pending  active   finished
    ContractStatusModel? result;
    if (status == 'close') {
      result = ContractStatusModel(
          status: S.of(context).close, color: AppColors.myRed);
    } else if (status == 'pending') {
      result = ContractStatusModel(
          status: S.of(context).pending, color: AppColors.myYellow);
    } else if (status == 'active') {
      result = ContractStatusModel(
          status: S.of(context).active, color: AppColors.myGreen);
    } else if (status == 'finished') {
      result = ContractStatusModel(
          status: S.of(context).finished, color: AppColors.myBlue);
    }

    return result;
  }
}
