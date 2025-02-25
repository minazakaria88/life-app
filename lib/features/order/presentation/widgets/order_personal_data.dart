import 'package:flutter/material.dart';
import 'package:life/core/functions/get_language.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/routes/routes.dart';
import 'package:life/core/utils/app_colors.dart';
import 'package:life/core/widgets/my_dropdown_menu.dart';

import '../../../../constant.dart';
import '../../../../generated/l10n.dart';
import '../manager/order_cubit.dart';

class OrderPersonalData extends StatelessWidget {
  const OrderPersonalData({
    super.key,
    required this.cubit,
  });

  final OrderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).city),
        10.height,
        MyDropDownMenu(
          menuHeight: 200,
          initialValue: cubit.selectedCityId,
          label: S.of(context).city,
          onSelected: (value) {
            cubit.selectedCityId = value!;
          },
          dropdownMenuEntries: cubit.citiesModel!.data.map((e) {
            return DropdownMenuEntry(
              label: getLanguage() == 'ar' ? e.name.ar : e.name.en,
              value: e.id,
            );
          }).toList(),
        ),
        20.height,
        Text(S.of(context).address),
        10.height,
        Row(
          children: [
            Expanded(
              child: MyDropDownMenu(
                menuHeight: 200,
                maxHeight: 50,
                initialValue: cubit.selectedLocationId,
                label: S.of(context).address,
                onSelected: (value) {
                  cubit.selectedLocationId = value!;
                },
                dropdownMenuEntries:
                    cubit.locationsModel!.data.reversed.map((e) {
                  return DropdownMenuEntry(
                    label:e.title! ,
                    value: e.id,
                  );
                }).toList(),
              ),
            ),
            5.width,
            ElevatedButton.icon(
              onPressed: () {
                context.pushNamed(
                  Routes.addLocations,
                  arguments: {
                    'action': AddLocationAction.orderScreen,
                    'model': null,
                  },
                ).then((c) => cubit.getLocations());
              },
              label: Text(S.of(context).add_location,style: const TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          ],
        ),
        20.height,
        Text(S.of(context).pick_up_branch),
        10.height,
        MyDropDownMenu(
          initialValue: cubit.selectedBranchId,
          label: S.of(context).pick_up_branch,
          onSelected: (value) {
            cubit.selectedBranchId = value!;
          },
          dropdownMenuEntries: cubit.branchesModel!.data.map((e) {
            return DropdownMenuEntry(
              label: getLanguage() == 'ar' ? e.name.ar : e.name.en,
              value: e.id,
            );
          }).toList(),
        ),
        50.height,
      ],
    );
  }
}
