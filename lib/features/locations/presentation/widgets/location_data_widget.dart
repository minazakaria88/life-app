import 'package:flutter/material.dart';
import 'package:life/constant.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/locations/data/models/location_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../generated/l10n.dart';
import '../manager/location_cubit.dart';
import 'add_location_dialog_widget.dart';

class LocationDataWidget extends StatelessWidget {
  const LocationDataWidget({
    super.key,
    required this.cubit,
    required this.action,
    required this.model,
  });

  final LocationCubit cubit;
  final AddLocationAction action;
  final LocationsData? model;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 20,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).delivery_address,
                style: const TextStyle(color: Colors.white),
              ),
              8.height,
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  10.width,
                  Expanded(
                    child: Text(
                      cubit.locationData.street ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              MyButton(
                onTap: () {
                  showDetailsLocationInputDialog(context);
                },
                color: Colors.black,
                text: S.of(context).selectLocation
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showDetailsLocationInputDialog(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      constraints: const BoxConstraints(
        maxHeight: double.infinity,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) => LocationInputDialogWidget(
        cubit: cubit,
        action: action,
        model: model,
      ),
    );
  }
}
