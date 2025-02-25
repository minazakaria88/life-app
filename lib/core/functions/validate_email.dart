import 'package:life/generated/l10n.dart';

import '../../main.dart';

validateEmail(String value) {
  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (value.isEmpty) {
    return S.of(NavigationService.navigatorKey.currentContext!).PleaseEnterYourEmail;
  } else if (!emailRegex.hasMatch(value)) {
    return S.of(NavigationService.navigatorKey.currentContext!).PleaseEnterValidEmail;
  }
  return null;
}