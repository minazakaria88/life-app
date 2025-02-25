import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/language/language_cubit.dart';
import 'package:life/generated/assets.dart';
import '../../generated/l10n.dart';
import 'language_selected_item.dart';
import 'language_state.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).language),
      ),
      body: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          var cubit = context.read<LanguageCubit>();
          return Column(
            children: [
              30.height,
              LanguageSelectedItem(
                lang: 'ar',
                onTap: (){
                  cubit.changeLanguage('ar');
                },
                title: S.of(context).arabic,
                image: Assets.imagesAr1,
              ),

              20.height,
              LanguageSelectedItem(
                lang: 'en',
                onTap: (){
                  cubit.changeLanguage('en');
                },
                title: S.of(context).english,
                image: Assets.imagesEn,
              ),
            ],
          );
        },
      ),
    );
  }
}

