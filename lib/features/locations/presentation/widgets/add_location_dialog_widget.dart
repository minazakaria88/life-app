import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/locations/data/models/location_model.dart';

import '../../../../constant.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/loader_widget.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/my_text_from.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/location_post_model.dart';
import '../manager/location_cubit.dart';
import '../manager/location_state.dart';

class LocationInputDialogWidget extends StatelessWidget {
  const LocationInputDialogWidget({
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
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: cubit.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).delivery_address,
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        8.height,
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                            ),
                            10.width,
                            Expanded(
                              child: Text(
                                cubit.locationData.street ?? '',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        20.height,
                        Text(S.of(context).location_name),
                        5.height,
                        MyTextForm(
                          label: S.of(context).location_name,
                          controller: cubit.locationNameController,
                          validator: (String value) {
                            if (value.isNullOrEmpty()) {
                              return S.of(context).please_enter_title;
                            }
                          },
                          prefixIcon:
                              const Icon(Icons.drive_file_rename_outline),
                          keyboardType: TextInputType.text,
                        ),
                        5.height,
                        Text(S.of(context).notes),
                        5.height,
                        MyTextForm(
                          label: S.of(context).notes,
                          controller: cubit.notesController,
                          validator: (String value) {
                            if (value.isNullOrEmpty()) {
                              return S.of(context).please_enter_notes;
                            }
                          },
                          prefixIcon:
                              const Icon(Icons.drive_file_rename_outline),
                          keyboardType: TextInputType.text,
                        ),
                        5.height,
                        Text(S.of(context).building_number),
                        5.height,
                        MyTextForm(
                          label: S.of(context).building_number,
                          controller: cubit.buildingNumberController,
                          validator: (String value) {
                            if (value.isNullOrEmpty()) {
                              return S.of(context).please_enter_title;
                            }
                          },
                          prefixIcon:
                              const Icon(Icons.drive_file_rename_outline),
                          keyboardType: TextInputType.number,
                        ),
                        5.height,
                        Text(S.of(context).floor_number),
                        5.height,
                        MyTextForm(
                          label: S.of(context).floor_number,
                          controller: cubit.floorNUmberController,
                          validator: (String value) {
                            if (value.isNullOrEmpty()) {
                              return S.of(context).please_enter_title;
                            }
                          },
                          prefixIcon:
                              const Icon(Icons.drive_file_rename_outline),
                          keyboardType: TextInputType.number,
                        ),
                        10.height,
                        MyButton(
                          onTap: () {
                            LocationPostModel data = LocationPostModel(
                              address: cubit.locationData.street ?? '',
                              city: cubit.locationData.locality ?? '',// send city name if it contract or send distinct name if it hour order
                              latitude: cubit.currentLocation.latitude,
                              longitude: cubit.currentLocation.longitude,
                              title: cubit.locationNameController.text,
                              notes: cubit.notesController.text,
                              type: 'c',  // c for contract h for hour
                              buildingNumber:
                                  cubit.buildingNumberController.text,
                              floorNumber: cubit.floorNUmberController.text,
                              country: cubit.locationData.country ?? '',
                            );
                            if (cubit.formKey.currentState!.validate()) {
                              if (model == null) {
                                cubit.postLocation(
                                  data: data.toJson(),
                                  action: action,
                                );
                              } else {
                                cubit.updateLocation(
                                  data: data.toJson(),
                                  id: model!.id!,
                                );
                              }
                            }
                          },
                          color: AppColors.primaryColor,
                          text: model == null
                              ? S.of(context).add_location
                              : S.of(context).updateLocation,
                        ),
                        20.height,
                      ],
                    ),
                  ),
                ),
              ),
              if (state is PostLocationLoadingState|| state is UpdateLocationLoadingState)
                const Positioned.fill(
                  child: LoaderWidget(),
                ),
            ],
          );
        },
      ),
    );
  }
}
