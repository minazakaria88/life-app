import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/functions/validate_email.dart';
import '../../../../core/functions/validate_iqama.dart';
import '../../../../core/functions/validate_phone_number.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_text_from.dart';
import '../../../../generated/l10n.dart';
import '../manager/register_cubit.dart';

class RegisterTextForms extends StatelessWidget {
   RegisterTextForms({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;
  final ValueNotifier<bool> isObscure = ValueNotifier<bool>(true);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextForm(
          label: S.of(context).fullName,
          controller: cubit.nameController,
          validator: (String value) {
            if (value.isEmpty) {
              return S.of(context).PleaseEnterYourFullName;
            } else if (value.length < 6) {
              return S.of(context).PleaseEnterValidFullName;
            }
          },
          prefixIcon: const Icon(
            Icons.person_2,
            color: AppColors.primaryColor,
          ),
          keyboardType: TextInputType.name,
        ),
        MyTextForm(
          keyboardType: TextInputType.phone,
          suffixIcon: const Icon(
            Icons.phone,
            color: AppColors.primaryColor,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 10.0),
            child: Text(
              '+966',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          label: S.of(context).phoneNumber,
          controller: cubit.numberController,
          validator: (String value) {
            return validatePhone(value,);
          },
        ),
        MyTextForm(
          keyboardType: TextInputType.number,
          label: S.of(context).national_iqama_id,
          controller: cubit.nationalIqamaId,
          validator: (String value) {
            return validateIqama(value);
          },
          prefixIcon: const Icon(
            CupertinoIcons.creditcard,
            color: AppColors.primaryColor,
          ),
        ),
        MyTextForm(
          keyboardType: TextInputType.emailAddress,
          label: S.of(context).email,
          controller: cubit.emailController,
          validator: (String value) {
            return validateEmail(value);
          },
          prefixIcon: const Icon(
            Icons.email,
            color: AppColors.primaryColor,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: isObscure,
          builder:(context, value, child) =>  MyTextForm(
            keyboardType: TextInputType.text,
            label: S.of(context).password,
            controller: cubit.passwordController,
            validator: (String value) {
              if (value.isEmpty) {
                return S.of(context).PleaseEnterYourPassword;
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
                     isObscure.value ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.primaryColor,
                )),
          ),
        ),
      ],
    );
  }
}
