import 'package:life/features/home/data/models/contract_nationality_model.dart';

class BranchesModel {
  late final int code;
  late final String message;
  late final List<BranchesModelData> data = [];

  BranchesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(BranchesModelData.fromJson(v));
      });
    }
  }
}

class BranchesModelData {
  late final int id;
  late final NameLang name;

  BranchesModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = NameLang.fromJson(json['name']);
  }
}
