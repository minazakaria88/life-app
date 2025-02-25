import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:life/core/functions/show_snack_bar.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/utils/app_colors.dart';
import 'package:life/core/widgets/my_button.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import '../../../../core/functions/validate_iqama.dart';
import '../../../../core/functions/validate_phone_number.dart';
import '../../../../core/widgets/loader_widget.dart';
import '../../../../core/widgets/my_text_from.dart';
import '../../../../generated/l10n.dart';
import '../manager/profile_cubit.dart';
import '../manager/profile_state.dart';
import 'package:life/injection.dart' as di;

import '../widgets/profile_header_widget.dart';
import '../widgets/profile_popup_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().setData(di.sl<HomeCubit>().profileModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ProfilePopupMenu(),
        ],
        title: Text(S.of(context).profile),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
        if (state is UpdateUserSuccessState) {
          showSnackBar(
            message: S.of(context).profileUpdateSuccessfully,
            context: context,
            title: S.of(context).profileUpdateSuccessfully,
            contentType: ContentType.success,
          );
        }

        if (state is ProfileFailureState) {
          showSnackBar(
            message: state.message,
            context: context,
            title: S.of(context).some_thing_went_wrong,
            contentType: ContentType.failure,
          );
        }
      }, builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    const ProfileHeaderWidget(),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.height,
                            5.height,
                            Text(
                              S.of(context).fullName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            5.height,
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
                                color: AppColors.black,
                              ),
                              keyboardType: TextInputType.name,
                            ),
                            5.height,
                            Text(
                              S.of(context).national_iqama_id,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            5.height,
                            MyTextForm(
                              keyboardType: TextInputType.number,
                              label: S.of(context).national_iqama_id,
                              controller: cubit.nationalIqamaIdController,
                              validator: (String value) {
                                return validateIqama(value);
                              },
                              prefixIcon: const Icon(
                                CupertinoIcons.creditcard,
                                color: AppColors.black,
                              ),
                              enabled: false,
                            ),
                            5.height,
                            Text(
                              S.of(context).phoneNumber,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            5.height,
                            MyTextForm(
                              keyboardType: TextInputType.phone,
                              suffixIcon: const Icon(
                                Icons.phone,
                                color: AppColors.primaryColor,
                              ),
                              enabled: false,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 10.0,
                                ),
                                child: Text(
                                  '+966',
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              label: S.of(context).phoneNumber,
                              controller: cubit.numberController,
                              validator: (String value) {
                                return validatePhone(
                                  value,
                                );
                              },
                            ),
                            20.height,
                            MyButton(
                              onTap: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.updateProfile(data: {
                                    "name": cubit.nameController.text,
                                  });
                                }
                              },
                              color: AppColors.primaryColor,
                              text: S.of(context).save_updates,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            if (state is ProfileLoadingState)
              const Positioned.fill(child: LoaderWidget()),
          ],
        );
      }),
    );
  }
}
