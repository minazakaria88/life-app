import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../constant.dart';
import '../../../../core/functions/my_dialog.dart';
import '../../../../core/routes/routes.dart';
import '../../../../generated/l10n.dart';
import '../../../delegation/presentation/widgets/delegation_card.dart';
import '../manager/location_cubit.dart';

class LocationsListview extends StatelessWidget {
  const LocationsListview({
    super.key,
    required this.cubit,
  });

  final LocationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cubit.locations.length,
      itemBuilder: (context, index) => DataShowCard(
        title: cubit.locations[index].address!,
        label1: S.of(context).building_number,
        label2: S.of(context).city,
        label3: S.of(context).details,
        value1: cubit.locations[index].buildingNumber ?? '',
        value2: cubit.locations[index].city ?? '',
        value3: cubit.locations[index].notes ?? '',
        remove: () {
          showMyDialog(
            context: context,
            message: S
                .of(context)
                .are_you_sure_you_want_to_delete_location,
            confirm: S.of(context).delete_location,
            confirmAction: () {
              cubit.deleteLocation(
                id: cubit.locations[index].id!,
                index: index,
              );
              context.pop();
            },
          );
        },
        edit: () {
          cubit.fillData(cubit.locations[index]);
          context.pushNamed(Routes.addLocations, arguments: {
            'action': AddLocationAction.locationScreen,
            'model': cubit.locations[index]
          });
        },
      ),
    );
  }
}