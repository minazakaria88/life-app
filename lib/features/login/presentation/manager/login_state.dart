abstract class LoginState{}


class LoginInitial extends LoginState{}

class ChangeObscureTextState extends LoginState{}


class LoginLoading extends LoginState{}
class LoginSuccess extends LoginState{}
class LoginFailure extends LoginState{
  final String message;
  LoginFailure({required this.message});
}

class ChangeCodeState extends LoginState{}

class VerifyAccountState extends LoginState{}


class LogoutLoading extends LoginState{}
class LogoutSuccess extends LoginState{}
class LogoutFailure extends LoginState{
  final String message;
  LogoutFailure({required this.message});
}

class VerifyOtpLoading extends LoginState{}
class VerifyOtpSuccess extends LoginState{}
class VerifyOtpFailure extends LoginState{
  final String message;
  VerifyOtpFailure({required this.message});
}

class SetLoadingState extends LoginState{}