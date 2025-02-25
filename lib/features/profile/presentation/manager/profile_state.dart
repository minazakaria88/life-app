abstract class ProfileState {

}

class ProfileInitState extends ProfileState {}


class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {}

class ProfileFailureState extends ProfileState {
  final String message;
  ProfileFailureState({required this.message});
}

class UpdateUserSuccessState extends ProfileState {}

