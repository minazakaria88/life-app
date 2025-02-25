import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/functions/validate_phone_number.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/loader_widget.dart';
import 'package:life/core/widgets/logo_image.dart';
import 'package:life/core/widgets/my_button.dart';
import '../../../../constant.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_text_from.dart';
import '../../../../generated/l10n.dart';
import '../manager/forget_password_cubit.dart';
import '../manager/forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccess) {
              context.pushNamedAndRemoveUntil(Routes.otpScreen, (c) => false,
                  arguments: {
                    'phoneNumber': context
                        .read<ForgetPasswordCubit>()
                        .phoneForgetController
                        .text,
                    'otpAction': OtpAction.forgetPassword
                  });
            }
          },
          builder: (context, state) {
            var cubit = context.read<ForgetPasswordCubit>();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: cubit.formKey,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        50.height,
                        const LogoImage(),
                        30.height,
                        Text(
                          S.of(context).resetPassword,
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        20.height,
                        MyTextForm(
                          keyboardType: TextInputType.phone,
                          suffixIcon: const Icon(
                            Icons.phone,
                            color: AppColors.primaryColor,
                          ),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                            child: Text(
                              '+966',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          label: S.of(context).phoneNumber,
                          controller: cubit.phoneForgetController,
                          validator: (String value) {
                            return validatePhone(value);
                          },
                        ),
                        10.height,
                        MyButton(
                          onTap: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.forgetPassword();
                            }
                          },
                          color: AppColors.primaryColor,
                          text: S.of(context).sendVerificationCode,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).backToLogin),
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
                        )
                      ],
                    ),
                    if (state is ForgetPasswordLoading)
                      const Positioned.fill(child: LoaderWidget()),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
