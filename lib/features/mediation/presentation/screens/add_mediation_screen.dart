import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/functions/show_snack_bar.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/my_dropdown_menu.dart';
import 'package:life/core/widgets/my_text_from.dart';
import 'package:life/generated/l10n.dart';

import '../../../../core/functions/get_language.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_button.dart';
import '../../data/models/nationality_model.dart';
import '../manager/mediation_cubit.dart';
import '../manager/mediation_state.dart';

class AddMediationScreen extends StatelessWidget {
  const AddMediationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mediation),
      ),
      body: BlocConsumer<MediationCubit, MediationState>(
        listener: (context, state) {
          if (state is PostMediationSuccessState) {
            showSnackBar(
              message: S.of(context).add_mediation_successfully,
              context: context,
              title: S.of(context).add_mediation_successfully,
              contentType: ContentType.success,
            );
            context.popUntil(Routes.mainScreen);
          }
          if(state is PostMediationFailureState){
            showSnackBar(
              message: state.message,
              context: context,
              title: '',
              contentType: ContentType.failure,
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<MediationCubit>();
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      S.of(context).nationality,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    10.height,
                    MyDropDownMenu(
                      width: double.infinity,
                      initialValue: cubit.selectedExperience,
                      label: S.of(context).nationality,
                      onSelected: (int value) {
                        cubit.selectedNationality = value;
                      },
                      dropdownMenuEntries: nationalityMediationList.map((e) {
                        return DropdownMenuEntry(
                          label: getLanguage() == 'ar' ? e.names.ar : e.names.en,
                          value: e.id,
                        );
                      }).toList(),
                    ),
                    20.height,
                    Text(
                      S.of(context).job,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    10.height,
                    MyDropDownMenu(
                      width: double.infinity,
                      initialValue: cubit.selectedExperience,
                      label: S.of(context).job,
                      onSelected: (int value) {
                        cubit.selectedJob = value;
                      },
                      dropdownMenuEntries: nationalityMediationList.map((e) {
                        return DropdownMenuEntry(
                          label: getLanguage() == 'ar' ? e.names.ar : e.names.en,
                          value: e.id,
                        );
                      }).toList(),
                    ),
                    20.height,
                    Text(
                      S.of(context).experience,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    10.height,
                    MyDropDownMenu(
                      width: double.infinity,
                      initialValue: cubit.selectedExperience,
                      label: S.of(context).experience,
                      onSelected: (int value) {
                        cubit.selectedExperience = value;
                      },
                      dropdownMenuEntries: nationalityMediationList.map((e) {
                        return DropdownMenuEntry(
                          label: getLanguage() == 'ar' ? e.names.ar : e.names.en,
                          value: e.id,
                        );
                      }).toList(),
                    ),
                    20.height,
                    Text(
                      S.of(context).visaNumber,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    10.height,
                    MyTextForm(
                      label: S.of(context).visaNumber,
                      controller: cubit.visaNumberController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return S.of(context).request;
                        }
                        return null;
                      },
                      prefixIcon: const Icon(
                        Icons.credit_card,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    10.height,
                    MyButton(
                      text: S.of(context).add,
                      color: AppColors.primaryColor,
                      onTap: () {
                        cubit.postMediation(data: {
                          'experience': cubit.selectedExperience,
                          'job': cubit.selectedJob,
                          'country_id': cubit.selectedNationality,
                          'visa_number': cubit.visaNumberController.text
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
