import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:life/features/register/data/repositories/register_repo.dart';
import 'package:life/features/register/presentation/manager/register_state.dart';
import '../../../../core/api_helper/api_helper.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../injection.dart';
import '../../data/models/register_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());

  final RegisterRepo registerRepo;

  var formKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalIqamaId = TextEditingController();

  void register({required RegisterModel model}) async {
    emit(RegisterLoadingState());
    var result = await registerRepo.register(model: model);
    result.fold(
        (l) => emit(RegisterFailureState(message: l.message)
            ), (r) async {
      await CacheHelper.setSecureString(CacheHelperKeys.token, r.data?.token ?? '');
      sl<ApiHelper>().setTokenIntoHeaderAfterLogin(r.data?.token ?? '');
      emit(RegisterSuccessState());
    });
  }

  void testRegister() async {
    emit(RegisterLoadingState());
    await Future.delayed(const Duration(seconds: 10));
    emit(RegisterSuccessState());
  }

  @override
  void emit(RegisterState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  Future<void> close() {
    numberController.dispose();
    passwordController.dispose();
    nameController.dispose();
    emailController.dispose();
    nationalIqamaId.dispose();
    return super.close();
  }
}
