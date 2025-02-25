import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:life/features/locations/data/models/location_model.dart';
import 'package:life/features/locations/data/repositories/location_repo.dart';


import '../../../../constant.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationRepo}) : super(InitLocationState());
  final LocationRepo locationRepo;
  var initCoordinates = const LatLng(24.681226, 46.7381333);

  final Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  TextEditingController locationNameController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController buildingNumberController = TextEditingController();
  TextEditingController floorNUmberController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void fillData(LocationsData model)
  {
    locationNameController.text = model.title!;
    notesController.text = model.notes!;
    buildingNumberController.text = model.buildingNumber!;
    floorNUmberController.text = model.floorNumber!;
    currentLocation = LatLng(model.latitude!, model.longitude!);
    emit(FillDataSuccessState());
  }

  void changeCameraPosition(LatLng latLng) {
    try {
      controller.future
          .then((value) => value.animateCamera(CameraUpdate.newLatLng(latLng)))
          .catchError((e) {});
    } catch (e) {
      emit(GetCurrentLocationFailureState());
    }
  }

  @override
  close() async {
    await controller.future.then((value) => value.dispose());
    locationNameController.dispose();
    notesController.dispose();
    buildingNumberController.dispose();
    floorNUmberController.dispose();
    super.close();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  bool isMoving = false;

  set isMovingValue(bool value) {
    isMoving = value;
    emit(GetCurrentLocationState());
  }

  LatLng currentLocation = const LatLng(24.681226, 46.7381333);

  void getCurrentLocation({final  LocationsData ?model}) async {
    emit(GetCurrentLocationState());
    try {
      if(model==null)
        {
          var position = await determinePosition();
          currentLocation = LatLng(position.latitude, position.longitude);
        }
      else
        {
          fillData(model);
        }

      changeCameraPosition(
          LatLng(currentLocation.latitude, currentLocation.longitude));

      emit(GetCurrentLocationSuccessState());
    } catch (e) {
      emit(GetCurrentLocationFailureState());
    }
  }
  // List<LatLng> polylineCoordinates = [
  //   LatLng(30.058994885055654, 31.33805438876152),
  //   LatLng(30.060500, 31.340000),
  //   LatLng(30.062000, 31.342000),
  //   LatLng(30.064500, 31.344500),
  //   LatLng(30.067000, 31.347000),
  //   LatLng(30.070000, 31.350000),
  // ];

  Placemark locationData = const Placemark();

  void getAddressFromLatLng() async {
    try {
      List<Placemark> addresses = await placemarkFromCoordinates(
        currentLocation.latitude,
        currentLocation.longitude,
      );
      locationData = addresses.first;
      isMoving = false;
      emit(GetCurrentLocationSuccessState());
    } catch (e) {
      emit(GetCurrentLocationFailureState());
    }
  }

  List<LocationsData> locations = [];
  void getSavedLocations() async {
    emit(GetLocationsLoadingState());
    var result = await locationRepo.getLocations();
    result.fold((f) => emit(GetLocationsFailureState(message: f.message)), (r) {
      locations = r.data.reversed.toList();
      emit(GetLocationsSuccessState());
    });
  }

  void deleteLocation({required int id, required int index}) async {
    emit(DeleteLocationLoadingState());
    var result = await locationRepo.deleteLocation(id: id);
    result.fold((f) => emit(DeleteLocationFailureState(message: f.message)),
        (r) {
      locations.removeAt(index);
      emit(DeleteLocationSuccessState());
    });
  }

  void postLocation({
    required Map<String, dynamic> data,
    required AddLocationAction action,
  }) async {
    emit(PostLocationLoadingState());
    var result = await locationRepo.postLocation(map: data);
    result.fold((f) => emit(PostLocationFailureState(message: f.message)), (r) {

      emit(PostLocationSuccessState());
    });
  }

  void updateLocation({
    required Map<String, dynamic> data,
    required int id,
  }) async {
    emit(UpdateLocationLoadingState());
    var result = await locationRepo.updateLocation(id: id, map: data);
    result.fold((f) => emit(UpdateLocationFailureState(message: f.message)),
        (r) {
      emit(UpdateLocationSuccessState());
    });
  }

  @override
  void emit(LocationState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }





}
