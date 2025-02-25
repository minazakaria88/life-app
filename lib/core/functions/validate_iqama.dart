import 'package:life/generated/l10n.dart';

import '../../main.dart';

validateIqama(String value) {
  if (value.isEmpty) {
    return S.of(NavigationService.navigatorKey.currentContext!).PleaseEnterYourNationalIqamaId;
  } else if (value.length < 8 || value.length > 11) {
    return S.of(NavigationService.navigatorKey.currentContext!).PleaseEnterValidNationalIqamaId;
  }
  return null;
}