import 'package:flutter/material.dart';
import 'package:life/core/functions/get_language.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/my_dropdown_menu.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/home_cubit.dart';
import 'filter_dialog_item_title.dart';
import 'package:life/injection.dart' as di;

class FilterDialogNationality extends StatelessWidget {
  const FilterDialogNationality({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.height,
        FilterDialogItemTitle(
          image: Assets.imagesNations,
          title: S.of(context).nationality,
        ),
        5.height,
        MyDropDownMenu(
          initialValue: di.sl<HomeCubit>().contractNationality,
          label: S.of(context).nationality,
          onSelected: (value) {
            di.sl<HomeCubit>().contractNationality = value!;
          },
          dropdownMenuEntries: di.sl<HomeCubit>().contractNationalityList.map((e) {
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
