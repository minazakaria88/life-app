import 'package:flutter/material.dart';
import 'package:life/core/functions/get_language.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/my_dropdown_menu.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/marital_status_model.dart';
import '../../manager/home_cubit.dart';
import 'filter_dialog_item_title.dart';
import 'package:life/injection.dart' as di;

class FilterDialogMaritalStatus extends StatelessWidget {
  const FilterDialogMaritalStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.height,
        FilterDialogItemTitle(
          image: Assets.imagesStatus,
          title: S.of(context).marital_status,
        ),
        5.height,
        MyDropDownMenu(
          initialValue: di.sl<HomeCubit>().contractMaritalStatus,
          label: S.of(context).marital_status,
          onSelected: (value) {
            di.sl<HomeCubit>().contractMaritalStatus = value!;
          },
          dropdownMenuEntries: maritalList.map((e) {
            return DropdownMenuEntry(
              label: getLanguage() == 'ar'
                  ? e.names.ar
                  : e.names.en,
              value: e.id,
            );
          }).toList(),
        ),
      ],
    );
  }
}
