import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/my_button.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_text_from.dart';
import '../../../../generated/l10n.dart';
import '../manager/forget_password_cubit.dart';
import '../manager/forget_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    super.key,
    required this.code,
    required this.phone,
  });
  final String code;
  final String phone;
  @override
  State<ResetPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).resetPassword),
      ),
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            showSnackBar(
              message: S.of(context).resetPasswordSuccessfully,
              context: context,
              title: S.of(context).resetPasswordSuccessfully,
              contentType: ContentType.success,
            );
            context.pushNamedAndRemoveUntil(Routes.login, (route) => false);
          }
        },
        builder: (context, state) {
          var cubit = context.read<ForgetPasswordCubit>();
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.height,
                  Text(S.of(context).enterNewPassword),
                  MyTextForm(
                    keyboardType: TextInputType.text,
                    label: S.of(context).password,
                    controller: cubit.passwordResetController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return S.of(context).PleaseEnterYourPassword;
                      } else if (value.length < 6) {
                        return S.of(context).PleaseEnterValidPassword;
                      }
                    },
                    obscureText: cubit.isObscurePassword,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AppColors.primaryColor,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changeObscurePassword();
                        },
                        icon: Icon(
                          cubit.isObscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.primaryColor,
                        )),
                  ),
                  20.height,
                  Text(S.of(context).confirmPassword),
                  MyTextForm(
                    keyboardType: TextInputType.text,
                    label: S.of(context).confirmPassword,
                    controller: cubit.confirmPasswordResetController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return S.of(context).PleaseEnterYourPassword;
                      } else if (value.length < 6) {
                        return S.of(context).PleaseEnterValidPassword;
                      }
                    },
                    obscureText: cubit.isObscureConfirmPassword,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AppColors.primaryColor,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changeObscureConfirmPassword();
                        },
                        icon: Icon(
                          cubit.isObscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.primaryColor,
                        )),
                  ),
                  20.height,
                  MyButton(
                    onTap: () {
                      if(cubit.formKey.currentState!.validate()){
                         cubit.resetPassword(code: 'widget.code', phone:'widget.phone');
                      }
                    },
                    color: AppColors.primaryColor,
                    text: S.of(context).confirm,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
