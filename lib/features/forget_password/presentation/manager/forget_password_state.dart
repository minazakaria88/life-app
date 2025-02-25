abstract class ForgetPasswordState  {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState{}

class ForgetPasswordError extends ForgetPasswordState{}



class ChangeObscurePassword extends ForgetPasswordState{}


class ResetPasswordLoading extends ForgetPasswordState{}

class ResetPasswordSuccess extends ForgetPasswordState{}

class ResetPasswordError extends ForgetPasswordState{}

