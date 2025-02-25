abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class ChangeObscureTextState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  final String message;
  RegisterFailureState({required this.message});
}

class RegisterLoadingState extends RegisterState {}

class ChangeCodeState extends RegisterState {}

class VerifyOtpLoading extends RegisterState{}
class VerifyOtpSuccess extends RegisterState{}
class VerifyOtpFailure extends RegisterState{
  final String message;
  VerifyOtpFailure({required this.message});
}

class ChangeLoadingState extends RegisterState{}