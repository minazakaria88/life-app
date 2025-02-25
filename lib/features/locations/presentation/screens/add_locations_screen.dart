import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:life/constant.dart';
import 'package:life/core/functions/show_snack_bar.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/routes/routes.dart';
import 'package:life/features/locations/data/models/location_model.dart';
import '../../../../generated/l10n.dart';
import '../manager/location_cubit.dart';
import '../manager/location_state.dart';
import '../widgets/back_button.dart';
import '../widgets/location_data_widget.dart';

class AddLocationsScreen extends StatefulWidget {
  const AddLocationsScreen({
    super.key,
    required this.action, required this.model,
  });
  final AddLocationAction action;  //come from order screen or location screen
  final LocationsData ?model; // if null add new location, if not null update location


  @override
  State<AddLocationsScreen> createState() => _AddLocationsScreenState();
}

class _AddLocationsScreenState extends State<AddLocationsScreen> {
  @override
  void initState() {
    context.read<LocationCubit>().getCurrentLocation(model: widget.model);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is PostLocationSuccessState) {
            showSnackBar(
              message: S.of(context).msg_location_added_successfully,
              context: context,
              title: S.of(context).msg_location_added_successfully,
              contentType: ContentType.success,
            );
            if (widget.action == AddLocationAction.orderScreen) {
              context.popUntil(Routes.orderScreen);
            } else {
              context.popUntil(Routes.mainScreen);
            }
          }
          if(state is UpdateLocationSuccessState){
            showSnackBar(
              message: S.of(context).msg_location_updated_successfully,
              context: context,
              title: S.of(context).msg_location_updated_successfully,
              contentType: ContentType.success,
            );
            context.popUntil(Routes.mainScreen);
          }
          if (state is PostLocationFailureState) {
            context.pop();
            showSnackBar(
              message: S.of(context).add_location_failed,
              context: context,
              title: S.of(context).add_location_failed,
              contentType: ContentType.failure,
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<LocationCubit>();
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: cubit.initCoordinates,
                  zoom: 14.4746,
                ),
                onTap: (LatLng latLng){
                  cubit.changeCameraPosition(latLng);
                },
                markers: {
                  Marker(
                    markerId: const MarkerId('1'),
                    position: cubit.currentLocation,
                    infoWindow:  InfoWindow(
                      title: cubit.locationData.street??'',
                    ),
                  ),
                },
                onMapCreated: (controller) {
                  cubit.controller.complete(controller);
                },
                onCameraMove: (position) {
                  cubit.currentLocation = position.target;
                  if(!cubit.isMoving) {
                    cubit.isMovingValue = true;
                  }
                },
                onCameraIdle: () {
                  cubit.getAddressFromLatLng();
                },
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                zoomGesturesEnabled: true,
                padding: const EdgeInsets.all(0),
                buildingsEnabled: true,
                cameraTargetBounds: CameraTargetBounds.unbounded,
                compassEnabled: true,
                indoorViewEnabled: true,
                mapToolbarEnabled: true,
                minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                rotateGesturesEnabled: true,
                scrollGesturesEnabled: true,
              ),
              const BackButtonWidget(),
              if (!cubit.isMoving)
                LocationDataWidget(
                  cubit: cubit,
                  model: widget.model,
                  action: widget.action,
                )
            ],
          );
        },
      ),
    );
  }
}
