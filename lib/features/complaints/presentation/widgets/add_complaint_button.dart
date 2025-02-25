import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:life/features/complaints/presentation/manager/complaints_cubit.dart';

import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection.dart';
import '../../../home/presentation/manager/home_cubit.dart';

class AddComplaintButton extends StatelessWidget {
  const AddComplaintButton({
    super.key,
    required this.cubit,
  });

  final ComplaintsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () {
        if (cubit.priority != 0) {
          if (cubit.formKey.currentState!.validate()) {
            if(sl<HomeCubit>().activeContracts.isNotEmpty) {
              cubit.addComplaint();
            }
            else {
              showSnackBar(
                message: S.of(context).no_active_contracts,
                context: context,
                title: S.of(context).no_active_contracts,
                contentType: ContentType.warning,
              );
            }
          }
        } else {
          showSnackBar(
            message: S.of(context).select_priority,
            context: context,
            title: S.of(context).select_priority,
            contentType: ContentType.help,
          );
        }
      },
      color: AppColors.primaryColor,
      text: S.of(context).add_ticket,
    );
  }
}
