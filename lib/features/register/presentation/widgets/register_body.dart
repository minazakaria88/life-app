import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/loader_widget.dart';
import 'package:life/features/register/data/models/register_model.dart';
import 'package:life/features/register/presentation/widgets/register_text_forms.dart';
import 'package:life/features/register/presentation/widgets/terms_and_conditions.dart';
import '../../../../constant.dart';
import '../../../../core/functions/check_internet_connectivity.dart';
import '../../../../core/functions/show_snack_bar.dart';
//import '../../../../core/helpers/notification_services.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../generated/l10n.dart';
import '../manager/register_cubit.dart';
import '../manager/register_state.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          context.pushNamedAndRemoveUntil(Routes.otpScreen, (c) => false,
              arguments: {
                'phoneNumber':
                    context.read<RegisterCubit>().numberController.text,
                'otpAction': OtpAction.login
              });
        }
        if (state is RegisterFailureState) {
          showSnackBar(
            message: state.message,
            context: context,
            title: S.of(context).loginFailed,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        var cubit = context.read<RegisterCubit>();
        return Stack(
          children: [
            Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    RegisterTextForms(cubit: cubit),
                    const TermsAndCondition(),
                    MyButton(
                      onTap: () {
                       // cubit.testRegister();
                        validateThenRegister(context, cubit);
                      },
                      color: AppColors.primaryColor,
                      text: S.of(context).signUp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).alreadyHaveAnAccount),
                        TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text(
                              S.of(context).signIn,
                              style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    20.height,
                  ],
                ),
              ),
            ),
            if (state is RegisterLoadingState)
            const Positioned.fill(child: LoaderWidget())
          ],
        );
      },
    );
  }

  void validateThenRegister(context, cubit) async {
    // String? deviceToken = await NotificationServices.getDeviceToken();
    RegisterModel model = RegisterModel(
      name: cubit.nameController.text,
      email: cubit.emailController.text,
      password: cubit.emailController.text,
      iqama: cubit.nationalIqamaId.text,
      phone: cubit.numberController.text,
      deviceToken: '12345',
    );
    if (await checkInternetConnectivity()) {
      if (cubit.formKey.currentState!.validate()) {
        cubit.register(model: model);
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
