import 'package:life/features/home/data/models/contract_nationality_model.dart';

class CitiesModel {
   late final int code;
   late final String message;
   late final List<CitiesModelData> data=[];

  CitiesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(CitiesModelData.fromJson(v));
      });
    }
  }
}

class CitiesModelData {
   late final int id;
   late final NameLang name;


  CitiesModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = NameLang.fromJson(json['name']);
  }
}