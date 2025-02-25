abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetUserDataSuccessState extends HomeState {}
class GetUserDataFailureState extends HomeState {}
class GetUserDataLoadingState extends HomeState {}


class ChangeIndexState extends HomeState {}


class GetNursesNationalityLoadingState extends HomeState {}

class GetNursesNationalitySuccessState extends HomeState {}

class GetNursesNationalityFailureState extends HomeState {
  final String message;

  GetNursesNationalityFailureState({required this.message});
}

class GetContractsLoadingState extends HomeState {}

class GetContractsSuccessState extends HomeState {}

class GetContractsFailureState extends HomeState {
  final String message;

  GetContractsFailureState({required this.message});
}

class GetFilterNursesLoadingState extends HomeState {}

class GetFilterNursesSuccessState extends HomeState {

}

class GetFilterNursesFailureState extends HomeState {
  final String message;

  GetFilterNursesFailureState({required this.message});
}

class ClearFilterState extends HomeState {}

class SetProgressValueState extends HomeState {}


class SendMessageState extends HomeState {}

class MyStateCancelled extends HomeState {}