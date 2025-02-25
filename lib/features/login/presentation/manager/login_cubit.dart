import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:life/core/helpers/cache_helper.dart';
import 'package:life/features/login/data/repositories/login_repo.dart';
import 'package:life/features/login/presentation/manager/login_state.dart';
import 'package:life/injection.dart' as di;
import '../../../../core/api_helper/api_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());
  final LoginRepo loginRepo;

  var formKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void login({
    required String phone,
    required String password,
  }) async {
    emit(LoginLoading());
    var result = await loginRepo.login(phone: phone, password: password);
    result.fold((l) {
      if (l.message == 'Verify account') {
        emit(VerifyAccountState());
      } else {
        emit(LoginFailure(message: l.message));
      }
    }, (r) async {
      await CacheHelper.setSecureString(CacheHelperKeys.token, r.data?.token ?? '');
      di.sl<ApiHelper>().setTokenIntoHeaderAfterLogin(r.data?.token ?? '');
      CacheHelper.saveData(key: CacheHelperKeys.verified, value: true);
      emit(LoginSuccess());
    });
  }

  void loginTest() async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoginSuccess());
  }

  void verifyOtpTest() async {
    emit(VerifyOtpLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(VerifyOtpFailure(message: 'otp is not correct'));
  }

  void logout() async {
    emit(LogoutLoading());
    var result = await loginRepo.logout();
    result.fold((l) => emit(LogoutFailure(message: l.message)), (r) async {
      await CacheHelper.clearData();
      emit(LogoutSuccess());
    });
  }

  void verifyOtp({
    required String errorMsg,
    required String code,
    required String phone,
  }) async {
    emit(VerifyOtpLoading());
    var result =
        await loginRepo.verifyOtp(phone: phone, otp: code, errorMsg: errorMsg);
    result.fold(
        (l) => emit(
              VerifyOtpFailure(message: l.message),
            ), (r) {
      CacheHelper.saveData(key: CacheHelperKeys.verified, value: true);
      emit(VerifyOtpSuccess());
    });
  }

  @override
  void emit(LoginState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  Future<void> close() {
    numberController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
