import 'package:life/features/language/language_model.dart';

import 'generated/assets.dart';

const List<LanguageModel> languageCode = [

  LanguageModel(code: 'en', name: 'English'),

  LanguageModel(code: 'ar', name: 'عربي'),

];

const String phoneRegExp = r'(^5\d{8}$)';

bool isLoggedInUser = false;

const List<String> images = [
  Assets.sliderImage1,
  Assets.sliderImage2,
  Assets.sliderImage3,
  Assets.sliderImage4,
  Assets.sliderImage5,
];

enum DelegationAction { edit, add }

enum AddLocationAction { orderScreen, locationScreen }

enum Language {
  ar,
  en,
}

enum OtpAction {
  login,
  forgetPassword,
}

List<String> services = [
  "Home Nursing",
  "Elderly Care",
  "Post-Surgery Care",
  "Maternity Care",
  "Infant Care",
  "Wound Dressing",
  "Physical Therapy",
  "IV Therapy",
  "Medication Management",
  "Emergency Care",
  "Chronic Disease Care",
  "Palliative Care",
  "Disability Support",
  "Mental Health Support",
  "Blood Pressure Monitoring",
  "Diabetes Care",
  "Vaccination Service",
  "Health Consultation",
];



String privacyPolicyLink = 'https://termify.io/privacy-policy-generator?gad_source=1&gclid=CjwKCAiAnpy9BhAkEiwA-P8N4hP3A75DCpoKq4unK9MWdeK5RgQZ4o6wmXgkI0gpCj4qNIJJd4DxHxoCZvQQAvD_BwE';

String termsAndConditionsLink = 'https://termify.io/privacy-policy-generator?gad_source=1&gclid=CjwKCAiAnpy9BhAkEiwA-P8N4hP3A75DCpoKq4unK9MWdeK5RgQZ4o6wmXgkI0gpCj4qNIJJd4DxHxoCZvQQAvD_BwE';
