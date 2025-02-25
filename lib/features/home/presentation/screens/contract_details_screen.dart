import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/nurse_data/data/models/contract_model.dart';
import 'package:life/generated/assets.dart';
import '../../../../core/functions/get_language.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../widgets/moquim_screen_widget/contract_details_item.dart';

class ContractDetailsScreen extends StatelessWidget {
  const ContractDetailsScreen({
    super.key,
    required this.model,
  });
  final ContractsData model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          S.of(context).contract_details,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle(text: S.of(context).nurse_details),
                  ContractDetailsItem(
                    title: S.of(context).fullName,
                    image: Assets.contractHuman,
                    value: getLanguage() == 'ar'
                        ? model.nurseData!.name!.ar!
                        : model.nurseData!.name!.en!,
                  ),
                  ContractDetailsItem(
                    title: S.of(context).education,
                    image: Assets.contractEducation,
                    value: getLanguage() == 'ar'
                        ? model.nurseData!.education!.name!.ar!
                        : model.nurseData!.education!.name!.en!,
                  ),
                  ContractDetailsItem(
                    title: S.of(context).country,
                    image: Assets.contractCountry,
                    value: getLanguage() == 'ar'
                        ? model.nurseData!.nationality!.name!.ar!
                        : model.nurseData!.nationality!.name!.en!,
                  ),
                ],
              ),
              20.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle(text: S.of(context).client_details),
                  ContractDetailsItem(
                      title: S.of(context).fullName,
                      image: Assets.contractHuman,
                      value: model.user!.name!),
                  ContractDetailsItem(
                      title: S.of(context).phoneNumber,
                      image: Assets.contractPhone,
                      value: model.user!.phone!),
                  ContractDetailsItem(
                    title: S.of(context).duration,
                    image: Assets.contractDuration,
                    value: "${model.package!.duration!} ${S.of(context).month}",
                  ),
                ],
              ),
              20.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle(text: S.of(context).price),
                  ContractDetailsItem(
                      title: S.of(context).price,
                      image: Assets.contractPrice,
                      value: "${model.package!.price} ${S.of(context).sar}"),
                  ContractDetailsItem(
                      title: S.of(context).tax,
                      image: Assets.contractPrice,
                      value: "${model.package!.tax}%"),
                  ContractDetailsItem(
                    title: S.of(context).discount,
                    image: Assets.contractDiscount,
                    value: "${model.package!.discount}%",
                  ),
                  ContractDetailsItem(
                      title: S.of(context).total,
                      image: Assets.contractPrice,
                      value: "${model.package!.total} ${S.of(context).sar}"),
                  20.height,
                ],
              ),
            ],
          ),
        ),
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

// Stack(
// children: [
// Container(
// height: 60,
// decoration: const BoxDecoration(
// color: AppColors.primaryColor,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(50),
// bottomRight: Radius.circular(50),
// )),
// ),
// SingleChildScrollView(
// child: Column(
// children: [
// ContractDetailsCard(
// title: S.of(context).nurse_details,
// subTitle: "",
// label1: S.of(context).fullName,
// label2: S.of(context).education,
// label3: S.of(context).country,
// value1: getLanguage() == 'ar'
// ? model.nurseData!.name!.ar!
//     : model.nurseData!.name!.en!,
// value2: getLanguage() == 'ar'
// ? model.nurseData!.education!.name!.ar!
//     : model.nurseData!.education!.name!.en!,
// value3: getLanguage() == 'ar'
// ? model.nurseData!.nationality!.name!.ar!
//     : model.nurseData!.nationality!.name!.en!,
// ),
// 10.height,
// ContractDetailsCard(
// title: S.of(context).client_details,
// subTitle: "",
// label1: S.of(context).fullName,
// label2: S.of(context).phoneNumber,
// label3: S.of(context).duration,
// value1: model.user!.name!,
// value2: model.user!.phone!,
// value3: "${model.package!.duration!} ${S.of(context).month}",
// ),
// 10.height,
// ContractDetailsCard(
// title: S.of(context).price,
// subTitle: "${model.price!}${S.of(context).sar}",
// label1: S.of(context).total,
// label2: S.of(context).discount,
// label3: S.of(context).tax,
// value1: "${model.package!.total}${S.of(context).sar}",
// value2: "${model.package!.discount}%",
// value3: "${model.package!.tax!}%",
// ),
// ],
// ),
// ),
// ],
// ),
