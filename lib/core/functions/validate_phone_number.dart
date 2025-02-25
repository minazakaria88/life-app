import 'package:life/generated/l10n.dart';

import '../../constant.dart';
import '../../main.dart';

validatePhone(String value) {
  final regExp = RegExp(
   phoneRegExp,
    caseSensitive: false,
    multiLine: false,
  );
  String? normalizedValue;
  if (containsArabicNumerals(value)) {
    normalizedValue = normalizeArabicNumbers(value);
  }

  if (value.isEmpty) {
    return S.of(NavigationService.navigatorKey.currentContext!).pleaseEnterPhoneNumber;
  } else if (!regExp.hasMatch(normalizedValue ?? value)) {
    return S.of(NavigationService.navigatorKey.currentContext!).PleaseEnterValidPhoneNumber;
  }
  return null;
}

bool containsArabicNumerals(String text) {
  // Check for Arabic-Indic numerals (٠-٩)
  final arabicRegex = RegExp(r'[\u0660-\u0669]');
  return arabicRegex.hasMatch(text);
}


String normalizeArabicNumbers(String text) {
  // Mapping Arabic-Indic numerals to Western Arabic numerals
  const Map<String, String> arabicToEnglishNumerals = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  // Replace each Arabic numeral with the corresponding English numeral
  arabicToEnglishNumerals.forEach((arabicNum, englishNum) {
    text = text.replaceAll(arabicNum, englishNum);
  });

  return text;
}