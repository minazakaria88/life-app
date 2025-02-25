import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/features/delegation/data/models/delegation_post_model.dart';

import '../../../../constant.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../generated/l10n.dart';
import '../manager/delegation_cubit.dart';

class AddDelegationButton extends StatelessWidget {
  const AddDelegationButton({
    super.key,
    required this.cubit,
    required this.action,
  });

  final DelegationCubit cubit;
  final DelegationAction action;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () {
        if (cubit.formKey.currentState!.validate()) {
          if (context.read<DelegationCubit>().selectedNationalityId == 0) {
            showSnackBar(
              message: S.of(context).select_nationality,
              context: context,
              title: S.of(context).select_nationality,
              contentType: ContentType.warning,
            );
          } else {
            DelegationPostModel model = DelegationPostModel(
                name: cubit.nameController.text,
                iqama: cubit.nationalIqamaId.text,
                phone: cubit.numberController.text,
                nationality: cubit.selectedNationalityId,
                status: action == DelegationAction.edit ? 1 : 0);
            if (action == DelegationAction.edit) {
              cubit.updateDelegation(
                  id: cubit.delegationId, data: model.toJson());
            } else {
              cubit.postDelegation(data: model.toJson());
            }
          }
        }
      },
      color: AppColors.primaryColor,
      text: action == DelegationAction.edit
          ? S.of(context).edit
          : S.of(context).add,
    );
  }
}
