import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import '../../../../../core/functions/show_toast.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/home_cubit.dart';
import '../../manager/home_state.dart';
import 'filter_dialog_age.dart';
import 'filter_dialog_martial_status.dart';
import 'filter_dialog_nationality.dart';
import 'package:life/injection.dart' as di;

Future<dynamic> myContractFilterDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: BlocProvider.value(
        value: di.sl<HomeCubit>(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).filter_menu_due_to,
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            cubit.clearFilter();
                            context.pop();
                            myContractFilterDialog(context);
                          },
                          child: Text(S.of(context).clear_all))
                    ],
                  ),
                  const FilterDialogNationality(),
                  const FilterDialogAge(),
                  const FilterDialogMaritalStatus(),
                  10.height,
                  MyButton(
                    onTap: () {
                      if (cubit.contractMaritalStatus == 0 &&
                          cubit.contractAge == 0 &&
                          cubit.contractNationality == 0) {
                        showToast(message: S.of(context).choose_atleast_one);
                      } else {
                        cubit.getFilterNurses(page: 1);
                        context.pop();
                        context.pushNamed(Routes.nurseFilter);
                      }
                    },
                    color: AppColors.primaryColor,
                    text: S.of(context).search,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ),
  );
}
