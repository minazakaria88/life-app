import 'package:flutter/material.dart';

import '../../../../core/functions/validate_phone_number.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_text_from.dart';
import '../../../../generated/l10n.dart';
import '../manager/login_cubit.dart';

class PhoneAndPassword extends StatelessWidget {
   PhoneAndPassword({
    super.key,
    required this.cubit,
    required this.numberController,
    required this.passwordController,
  });

  final LoginCubit cubit;
  final TextEditingController numberController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> isObscure = ValueNotifier<bool>(true);

   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextForm(
          keyboardType: TextInputType.phone,
          suffixIcon: const Icon(
            Icons.phone,
            color: AppColors.primaryColor,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: Text(
              '+966',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          label: S.of(context).phoneNumber,
          controller: numberController,
          validator: (String value) {
            return validatePhone(value);
          },
        ),
      ValueListenableBuilder(
        valueListenable: isObscure,
        builder:(context, value, child) =>  MyTextForm(
              keyboardType: TextInputType.text,
              label: S.of(context).password,
              controller: passwordController,
              validator: (String value) {
                if (value.isEmpty) {
                  return S.of(context).PleaseEnterYourPassword;
                } else if (value.length < 6) {
                  return S.of(context).PleaseEnterValidPassword;
                }
              },
              obscureText: isObscure.value,
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColors.primaryColor,
              ),
              suffixIcon: IconButton(
                  onPressed: () {

                      isObscure.value = !isObscure.value;

                  },
                  icon: Icon(
                    isObscure.value ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.primaryColor,
                  )),
            ),
      )
      ],
    );
  }
}
