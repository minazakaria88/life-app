import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/functions/get_language.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/loader_widget.dart';
import 'package:life/core/widgets/my_dropdown_menu.dart';
import 'package:life/features/delegation/presentation/manager/delegation_cubit.dart';
import '../../../../constant.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/functions/validate_iqama.dart';
import '../../../../core/functions/validate_phone_number.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_text_from.dart';
import '../../../../generated/l10n.dart';
import '../manager/delegation_state.dart';
import '../widgets/add_delegation_button.dart';
//import '../widgets/nationality_drop_down_menu.dart';

class AddDelegationScreen extends StatefulWidget {
  const AddDelegationScreen({
    super.key,
    required this.action,
    required this.cubit,
  });
  final DelegationAction action;
  final DelegationCubit cubit;

  @override
  State<AddDelegationScreen> createState() => _AddDelegationScreenState();
}

class _AddDelegationScreenState extends State<AddDelegationScreen> {
  @override
  void initState() {
    widget.cubit.getNationality();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              widget.cubit.clearData();
              context.pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(widget.action == DelegationAction.edit
            ? S.of(context).edit_delegation
            : S.of(context).add_delegation),
      ),
      body: BlocProvider.value(
        value: widget.cubit,
        child: BlocConsumer<DelegationCubit, DelegationState>(
          listener: (context, state) {
            if (state is PostDelegationSuccessState ||
                state is UpdateDelegationSuccessState) {
              widget.cubit.clearData();
              context.pop();
            } else if (state is PostDelegationFailureState ||
                state is UpdateDelegationFailureState) {
              showSnackBar(
                message: S.of(context).some_thing_went_wrong,
                context: context,
                title: S.of(context).some_thing_went_wrong,
                contentType: ContentType.failure,
              );
            }
          },
          builder: (context, state) {
            return state is GetNationalityLoadingState
                ? const LoaderWidget()
                : Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Form(
                            key: widget.cubit.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                30.height,
                                Text(S.of(context).fullName),
                                5.height,
                                MyTextForm(
                                  label: S.of(context).fullName,
                                  controller: widget.cubit.nameController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return S
                                          .of(context)
                                          .PleaseEnterYourFullName;
                                    } else if (value.length < 6) {
                                      return S
                                          .of(context)
                                          .PleaseEnterValidFullName;
                                    }
                                  },
                                  prefixIcon: const Icon(
                                    Icons.person_2,
                                    color: AppColors.black,
                                  ),
                                  keyboardType: TextInputType.name,
                                ),
                                10.height,
                                Text(S.of(context).phoneNumber),
                                5.height,
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
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  label: S.of(context).phoneNumber,
                                  controller: widget.cubit.numberController,
                                  validator: (String value) {
                                    return validatePhone(value);
                                  },
                                ),
                                10.height,
                                Text(S.of(context).national_iqama_id),
                                // 5.height,
                                MyTextForm(
                                  keyboardType: TextInputType.number,
                                  label: S.of(context).national_iqama_id,
                                  controller: widget.cubit.nationalIqamaId,
                                  validator: (String value) {
                                    return validateIqama(value);
                                  },
                                  prefixIcon: const Icon(
                                    CupertinoIcons.creditcard,
                                    color: AppColors.black,
                                  ),
                                ),
                                10.height,
                                Text(S.of(context).nationality),
                                10.height,
                                // NationalitySearchAnchor(cubit: widget.cubit),
                                NationalityDropDownMenu(
                                  cubit: widget.cubit,
                                ),
                                20.height,
                                state is UpdateDelegationLoadingState
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      )
                                    : AddDelegationButton(
                                        cubit: widget.cubit,
                                        action: widget.action),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (state is PostDelegationLoadingState)
                        const Positioned.fill(child: LoaderWidget()),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

class NationalityDropDownMenu extends StatelessWidget {
  const NationalityDropDownMenu({super.key, required this.cubit});
  final DelegationCubit cubit;
  @override
  Widget build(BuildContext context) {
    return MyDropDownMenu(
      menuHeight: 300,
      initialValue: cubit.selectedNationalityId,
      label: S.of(context).nationality,
      onSelected: (value) {
        cubit.selectedNationalityId = value;
      },
      dropdownMenuEntries: cubit.nationalities
          .map(
            (r) => DropdownMenuEntry(
              value: r.id,
              label: getLanguage() == 'ar' ? r.names.ar : r.names.en,
            ),
          )
          .toList(),
    );
  }
}
