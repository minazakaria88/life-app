import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:life/features/forget_password/data/repositories/forget_password_repo.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.forgetPasswordRepo})
      : super(ForgetPasswordInitial());
  final ForgetPasswordRepo forgetPasswordRepo;

  TextEditingController phoneForgetController = TextEditingController();
  TextEditingController phoneResetController = TextEditingController();
  TextEditingController passwordResetController = TextEditingController();
  TextEditingController confirmPasswordResetController =
      TextEditingController();

  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  var formKey = GlobalKey<FormState>();

  void changeObscurePassword() {
    isObscurePassword = !isObscurePassword;
    emit(ChangeObscurePassword());
  }

  void changeObscureConfirmPassword() {
    isObscureConfirmPassword = !isObscureConfirmPassword;
    emit(ChangeObscurePassword());
  }

  void forgetPassword() async {
    emit(ForgetPasswordLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(ForgetPasswordSuccess());
    var result = await forgetPasswordRepo.forgetPassword(
        phone: phoneForgetController.text);
    result.fold((l) => emit(ForgetPasswordError()),
        (r) => emit(ForgetPasswordSuccess()));
  }

  void resetPassword({required String code, required String phone}) async {
    emit(ResetPasswordLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(ResetPasswordSuccess());
    var result = await forgetPasswordRepo.resetPassword(data: {
      "phone": phone,
      "password": passwordResetController.text,
      "code": code,
      "password_confirmation": confirmPasswordResetController.text,
    });
    result.fold(
        (l) => emit(ResetPasswordError()), (r) => emit(ResetPasswordSuccess()));
  }


  @override
  Future<void> close() {
    phoneForgetController.dispose();
    phoneResetController.dispose();
    passwordResetController.dispose();
    confirmPasswordResetController.dispose();
    return super.close();
  }
}
