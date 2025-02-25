import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/cache_helper.dart';
import '../../../../constant.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../language/language_cubit.dart';
import '../../../language/language_state.dart';

class ChooseLanguageWidget extends StatelessWidget {
  const ChooseLanguageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit,LanguageState>(
        builder: (context, state) {
          var cubit = context.read<LanguageCubit>();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              borderRadius: BorderRadius.circular(20.0),
              elevation: 1,
              iconEnabledColor: AppColors.primaryColor,
              alignment: AlignmentDirectional.centerEnd,
              value: CacheHelper.getData(key: CacheHelperKeys.lang),
              items: languageCode.map((e) {
                return DropdownMenuItem(
                  value: e.code,
                  child: Text(e.name,style: const TextStyle(color: AppColors.primaryColor),),
                );
              }).toList(),
              onChanged: (value){
                cubit.changeLanguage(value as String);
              },
            ),
          );
        }
    );
  }
}