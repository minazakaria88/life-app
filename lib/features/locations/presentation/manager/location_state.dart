abstract class LocationState {}


class  InitLocationState extends LocationState {}

class GetLocationsLoadingState extends LocationState {}

class GetLocationsSuccessState extends LocationState {}

class GetLocationsFailureState extends LocationState {
  final String message;
  GetLocationsFailureState({required this.message});
}


class PostLocationLoadingState extends LocationState {}

class PostLocationSuccessState extends LocationState {}

class PostLocationFailureState extends LocationState {
  final String message;
  PostLocationFailureState({required this.message});
}

class DeleteLocationLoadingState extends LocationState {}

class DeleteLocationSuccessState extends LocationState {}

class DeleteLocationFailureState extends LocationState {
  final String message;
  DeleteLocationFailureState({required this.message});
}

class UpdateLocationLoadingState extends LocationState {}

class UpdateLocationSuccessState extends LocationState {}

class UpdateLocationFailureState extends LocationState {
  final String message;
  UpdateLocationFailureState({required this.message});
}

class GetCurrentLocationState extends LocationState {}

class GetCurrentLocationFailureState extends LocationState {}

class GetCurrentLocationSuccessState extends LocationState {}


class FillDataSuccessState extends LocationState {}