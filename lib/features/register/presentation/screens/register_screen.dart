import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/logo_image.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../login/presentation/widgets/choose_language_widget.dart';
import '../widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             const SizedBox(
              width: double.infinity,
              height: 30,
            ),
            const ChooseLanguageWidget(),
            10.height,
            const LogoImage(),
            20.height,
            Text(
              S.of(context).createYourAccount,
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const RegisterBody(),
          ],
        ),
      ),
    );
  }
}


