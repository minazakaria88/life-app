import 'package:life/features/home/data/models/contract_nationality_model.dart';

class NationalityDataModel {
  late final int id;
  late final NameLang names;

  NationalityDataModel({
    required this.id,
    required this.names,
  });


}

List<NationalityDataModel> nationalityMediationList = [
  NationalityDataModel(
      id: 1, names: NameLang(ar: 'بخبرة', en: 'With experience')),
  NationalityDataModel(
      id: 2, names: NameLang(ar: 'بدون خبرة', en: 'Without experience')),
];
