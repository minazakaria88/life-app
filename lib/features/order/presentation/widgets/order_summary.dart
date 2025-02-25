import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';
import '../../../../core/functions/get_language.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

import '../../../home/presentation/widgets/moquim_screen_widget/contract_details_item.dart';
import '../../../nurse_data/data/models/nurse_data_model.dart';
import '../manager/order_cubit.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
    required this.model,
    required this.cubit,
  });

  final NurseDataModel model;
  final OrderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle(text: S.of(context).nurse_details),
              ContractDetailsItem(
                title: S.of(context).fullName,
                image: Assets.contractHuman,
                value: getLanguage() == 'ar'
                    ? model.name!.ar!
                    : model.name!.en!,
              ),
              ContractDetailsItem(
                title: S.of(context).education,
                image: Assets.contractEducation,
                value: getLanguage() == 'ar'
                    ? model.education!.name!.ar!
                    : model.education!.name!.en!,
              ),
              ContractDetailsItem(
                title: S.of(context).country,
                image: Assets.contractCountry,
                value: getLanguage() == 'ar'
                    ? model.nationality!.name!.ar!
                    : model.nationality!.name!.en!,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle(text: S.of(context).details),
              ContractDetailsItem(
                  title: S.of(context).price,
                  image: Assets.contractPrice,
                  value: "${cubit.packagesData!.price} ${S.of(context).sar}"),

              ContractDetailsItem(
                  title: S.of(context).tax,
                  image: Assets.contractPrice,
                  value: "${cubit.packagesData!.tax}%"),
              ContractDetailsItem(
                title: S.of(context).discount,
                image: Assets.contractDiscount,
                value: "${cubit.packagesData!.discount}%",
              ),
              ContractDetailsItem(
                title: S.of(context).duration,
                image: Assets.contractDuration,
                value: "${cubit.packagesData!.duration} ${S.of(context).month}",
              ),
              ContractDetailsItem(
                  title: S.of(context).total,
                  image: Assets.contractPrice,
                  value: "${cubit.packagesData!.total} ${S.of(context).sar}"),
              20.height,
            ],
          ),
          // ContractDetailsCard(
          //   title: S.of(context).nurse_details,
          //   subTitle: "",
          //   label1: S.of(context).fullName,
          //   label2: S.of(context).education,
          //   label3: S.of(context).country,
          //   value1:getLanguage()=='ar'?model.name!.ar??'' : model.name!.en??'',
          //   value2: getLanguage()=='ar'?model.education!.name!.ar??'' : model.education!.name!.en??'',
          //   value3: getLanguage()=='ar'?model.nationality!.name!.ar??'' : model.nationality!.name!.en??'',
          // ),
          // ContractDetailsCard(
          //   title: S.of(context).client_details,
          //   subTitle: "",
          //   label1: S.of(context).fullName,
          //   label2: S.of(context).phoneNumber,
          //   label3: S.of(context).duration,
          //   value1:di.sl<HomeCubit>().profileModel?.data!.name??'',
          //   value2: di.sl<HomeCubit>().profileModel?.data!.phone??'',
          //   value3: "${cubit.packagesData!.duration} ${S.of(context).month}",
          // ),
          // ContractDetailsCard(
          //   title: S.of(context).price,
          //   subTitle: "${cubit.packagesData!.price}${S.of(context).sar}",
          //   label1: S.of(context).total,
          //   label2: S.of(context).discount,
          //   label3: S.of(context).tax,
          //   value1: "${cubit.packagesData!.total}${S.of(context).sar}",
          //   value2: "${cubit.packagesData!.discount}%",
          //   value3: "${cubit.packagesData!.tax!}%",
          // ),
        ],
      ),
    );
  }
  Text sectionTitle({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        color: AppColors.myRed,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}