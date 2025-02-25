import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:life/core/functions/get_language.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/routes/routes.dart';
import 'package:life/core/widgets/my_button.dart';
import 'package:life/features/home/presentation/widgets/moquim_screen_widget/contract_card_column.dart';
import 'package:life/features/nurse_data/data/models/nurse_data_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../widgets/resume_widget.dart';

class NurseView extends StatelessWidget {
  const NurseView({super.key, required this.id, required this.model});
  final int id;
  final NurseDataModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).nurse_details),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  30.height,
                  Center(
                    child: Hero(
                      tag: id,
                      child: Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CachedNetworkImage(
                          imageUrl: model.image!,
                          placeholder: (context, url) => Image.asset(
                            Assets.imagesLoading,
                            fit: BoxFit.fill,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          height: 150,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  5.height,
                  Text(
                    S.of(context).nurse_details,
                  ),
                  10.height,
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.myGreen ,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: ContractCardColumn(
                              title: S.of(context).fullName,
                              value: getLanguage() == 'ar'
                                  ? model.name!.ar!
                                  : model.name!.en!,
                            ),
                          ),
                        ),
                        5.width,
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: ContractCardColumn(
                              title: S.of(context).education,
                              value: getLanguage() == 'ar'
                                  ? model.education!.name!.ar!
                                  : model.education!.name!.en!,
                            ),
                          ),
                        ),
                        5.width,
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: ContractCardColumn(
                              title: S.of(context).country,
                              value: getLanguage() == 'ar'
                                  ? model.nationality!.name!.ar!
                                  : model.nationality!.name!.en!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.height,
                  ResumeWidget(resumeUrl: model.resume!),
                  10.height,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      getLanguage() == 'ar'
                          ? model.description!.ar!
                          : model.description!.en!,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          MyButton(
            onTap: () {
              context.pushNamed(Routes.orderScreen, arguments: model);
            },
            color: AppColors.primaryColor,
            text: S.of(context).service_request,
          ),
          20.height,
        ],
      ),
    );
  }
}
