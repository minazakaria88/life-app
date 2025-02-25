import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:life/constant.dart';
import 'package:life/core/helpers/cache_helper.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/helpers/notification_services.dart';
import 'package:life/core/routes/app_routes.dart';
import 'package:life/features/language/language_cubit.dart';
import 'package:life/injection.dart';
import 'bloc_observer.dart';
import 'core/routes/routes.dart';
import 'core/utils/app_theme.dart';
import 'features/language/language_state.dart';
import 'generated/l10n.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  setupServicesLocator();
  await NotificationServices.init();
  await checkIfTheUserLoggedIn();
  runApp(
    DevicePreview(enabled: false, builder: (context) => const LifeApp()),
  );
}

class LifeApp extends StatelessWidget {
  const LifeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LanguageCubit>()..initLanguage(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state)  {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'LifeApp',
            theme: appTheme(),
            locale: Locale(CacheHelper.getData(key: CacheHelperKeys.lang)),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute:
                isLoggedInUser ? Routes.mainScreen : Routes.onboarding,
            navigatorKey: NavigationService.navigatorKey,
          );
        },
      ),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

Future<void> checkIfTheUserLoggedIn() async {
  //String token = await CacheHelper.getData(key: CacheHelperKeys.token)??'';
  String token= await CacheHelper.getSecureString(CacheHelperKeys.token);
  var verified = await CacheHelper.getData(key: CacheHelperKeys.verified);
  if (verified == true && !token.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
