import 'contract_nationality_model.dart';

class AgeRangeModel {
  int id;
  NameLang names;

  AgeRangeModel({required this.id, required this.names});
}


List<AgeRangeModel> ages = [
  AgeRangeModel(
    id: 1,
    names: NameLang(
      ar: 'من 18 الى 25',
      en: 'From 18 to 25',
    ),
  ),
  AgeRangeModel(
    id: 2,
    names: NameLang(
      ar: 'من 26 الى 35',
      en: 'From 26 to 35',
    ),
  ),
  AgeRangeModel(
    id: 3,
    names: NameLang(
      ar: 'اكبر من 36',
      en: 'More than 36',
    ),
  ),
];