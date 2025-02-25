import '../../../home/data/models/contract_nationality_model.dart';

class Packages {
  int? code;
  List<PackagesData> data=[];

  Packages({this.code,required this.data});

  Packages.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <PackagesData>[];
      json['data'].forEach((v) {
        data.add(PackagesData.fromJson(v));
      });
    }
  }
}

class PackagesData {
  int? id;
  NameLang? name;
  double? price;
  double? discount;
  int? duration;
  double? total;
  double? tax;

  PackagesData(
      {this.id,
        this.name,
        this.price,
        this.discount,
        this.duration,
        this.total,
        this.tax});

  PackagesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? NameLang?.fromJson(json['name']) : null;
    price = json['price']is int? ? json['price'].toDouble() : json['price'];
    discount = json['discount']is int? ? json['discount'].toDouble() : json['discount'];
    duration = json['duration'] ;
    total = json['total']is int? json['total'].toDouble() : json['total'];
    tax = json['tax'] is int? json['tax'].toDouble() : json['tax'];
  }


}
