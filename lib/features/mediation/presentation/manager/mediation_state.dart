abstract class MediationState {}

class MediationInitial extends MediationState {}

class GetMediationLoadingState extends MediationState {}

class GetMediationSuccessState extends MediationState {}

class GetMediationFailureState extends MediationState {
  final String message;
  GetMediationFailureState({required this.message});
}

class PostMediationLoadingState extends MediationState {}

class PostMediationSuccessState extends MediationState {}

class PostMediationFailureState extends MediationState {
  final String message;
  PostMediationFailureState({required this.message});
}