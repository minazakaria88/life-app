import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/functions/check_internet_connectivity.dart';
import 'package:life/core/functions/show_snack_bar.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/utils/app_colors.dart';
import 'package:life/core/widgets/my_button.dart';
import 'package:life/features/login/presentation/manager/login_cubit.dart';
import 'package:life/features/login/presentation/manager/login_state.dart';
import 'package:life/generated/l10n.dart';
import '../../../../constant.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/loader_widget.dart';
import '../../../../core/widgets/logo_image.dart';
import '../widgets/choose_language_widget.dart';
import '../widgets/dont_have_an_account.dart';
import '../widgets/forget_password.dart';
import '../widgets/phone_and_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            showSnackBar(
              message: S.of(context).loginSuccessfully,
              context: context,
              title: S.of(context).loginSuccessfully,
              contentType: ContentType.success,
            );
            context.pushNamedAndRemoveUntil(
              Routes.mainScreen,
              (c) => false,
            );
          }
          if (state is LoginFailure) {
            showSnackBar(
              message: state.message,
              context: context,
              title: S.of(context).loginFailed,
              contentType: ContentType.failure,
            );
          }
          if (state is VerifyAccountState) {
            context.pushNamedAndRemoveUntil(
              Routes.otpScreen,
              (c) => false,
              arguments: {
                'phoneNumber': context.read<LoginCubit>().numberController.text,
                'otpAction': OtpAction.login,
              },
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<LoginCubit>();
          return Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 0.8,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        const SizedBox(
                          width: double.infinity,
                        ),
                        const ChooseLanguageWidget(),
                        10.height,
                        const LogoImage(),
                        20.height,
                        Text(
                          S.of(context).welcomeBack,
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        20.height,
                        AutofillGroup(
                          child: PhoneAndPassword(
                            cubit: cubit,
                            passwordController: cubit.passwordController,
                            numberController: cubit.numberController,
                          ),
                        ),
                        20.height,
                        const ForgetPassword(),
                        MyButton(
                          onTap: () async {
                            validateThenLogin(context, cubit);
                            //context.read<LoginCubit>().loginTest();
                          },
                          color: AppColors.primaryColor,
                          text: S.of(context).signIn,
                        ),
                        20.height,
                        const DontHaveAnAccount(),
                        20.height,
                      ],
                    ),
                  ),
                ),
              ),
              if (state is LoginLoading) const LoaderWidget()
            ],
          );
        },
      ),
    );
  }

  void validateThenLogin(context, cubit) async {
    if (await checkInternetConnectivity()) {
      if (cubit.formKey.currentState!.validate()) {
        cubit.login(
          password: cubit.passwordController.text,
          phone: cubit.numberController.text,
        );
      }
    } else {
      showSnackBar(
        message: S.of(context).pleaseCheckYourInternetConnection,
        context: context,
        title: S.of(context).noInternetConnection,
        contentType: ContentType.warning,
      );
    }
  }
}
