import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';
import '../../../../../generated/l10n.dart';
import '../../../home/presentation/widgets/moquim_screen_widget/contract_card_column.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.duration,
    this.price,
    this.tax,
    required this.isSelected,
  });
  final Function onTap;
  final String title;
  final int duration;
  final dynamic price;
  final dynamic tax;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
       // duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isSelected ?const Color(0xffF9E2AF): Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    10.width,
                    if(isSelected)
                    const Icon(
                      Icons.check,
                      size: 30,
                      color: Color(0xff009FBD),
                    ),

                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ContractCardColumn(
                    title: S.of(context).duration,
                    value: '$duration ${S.of(context).month}',
                  ),
                  ContractCardColumn(
                    title: S.of(context).price,
                    value: '$price ${S.of(context).sar}',
                  ),
                  ContractCardColumn(
                    title: S.of(context).tax,
                    value: '$tax',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
