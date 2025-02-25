import 'package:flutter/material.dart';
import 'package:life/core/functions/get_language.dart';
import 'package:life/core/helpers/extensions.dart';
import '../../../../../core/widgets/my_dropdown_menu.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../injection.dart';
import '../../../data/models/age_model.dart';
import '../../manager/home_cubit.dart';
import 'filter_dialog_item_title.dart';

class FilterDialogAge extends StatelessWidget {
  const FilterDialogAge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.height,
        FilterDialogItemTitle(
          image: Assets.imagesAge,
          title: S.of(context).age,
        ),
        5.height,
        MyDropDownMenu(
          onSelected: (value) {
           sl<HomeCubit>().contractAge = value!;
          },
          label: S.of(context).age,
          dropdownMenuEntries: ages.map((e) {
            return DropdownMenuEntry(
              label: getLanguage() == 'ar'
                  ? e.names.ar
                  : e.names.en,
              value: e.id,
            );
          }).toList(),
          initialValue:sl<HomeCubit>().contractAge,
        ),
      ],
    );
  }
}

