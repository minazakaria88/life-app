abstract class DelegationState  {}

class DelegationInitial extends DelegationState {}

class DelegationLoadingState extends DelegationState {}

class DelegationSuccessState extends DelegationState {}

class DelegationFailureState extends DelegationState {
  final String message;

  DelegationFailureState({required this.message});
}

class DeleteDelegationSuccessState extends DelegationState {}

class DeleteDelegationFailureState extends DelegationState {
  final String message;
  DeleteDelegationFailureState({required this.message});
}

class DeleteDelegationLoadingState extends DelegationState {}


class UpdateDelegationSuccessState extends DelegationState {}

class UpdateDelegationFailureState extends DelegationState {
  final String message;
  UpdateDelegationFailureState({required this.message});
}

class UpdateDelegationLoadingState extends DelegationState {}


class PostDelegationSuccessState extends DelegationState {}

class PostDelegationFailureState extends DelegationState {
  final String message;
  PostDelegationFailureState({required this.message});
}

class PostDelegationLoadingState extends DelegationState {}


class GetNationalitySuccessState extends DelegationState {}
class GetNationalityFailureState extends DelegationState {
  final String message;
  GetNationalityFailureState({required this.message});
}
class GetNationalityLoadingState extends DelegationState {}



