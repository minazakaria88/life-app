import 'contract_nationality_model.dart';

class MaritalStatusModel {
  int id;
  NameLang names;

  MaritalStatusModel({required this.id, required this.names});
}

List<MaritalStatusModel> maritalList = [
  MaritalStatusModel(
    id: 1,
    names: NameLang(
      ar: 'عزباء',
      en: 'Single',
    ),
  ),
  MaritalStatusModel(
    id: 2,
    names: NameLang(
      ar: 'متزوجه',
      en: 'Married',
    ),
  ),
  MaritalStatusModel(
    id: 3,
    names: NameLang(
      ar: 'ارمله',
      en: 'Widow',
    ),
  ),
  MaritalStatusModel(
    id: 4,
    names: NameLang(
      ar: 'مطلقه',
      en: 'Divorced',
    ),
  ),
];