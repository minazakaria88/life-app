
import '../../../nurse_data/data/models/contract_model.dart';

class Locations {
  int? code;
  String? message;
  List<LocationsData> data=[];

  Locations({this.code, required this.data});

  Locations.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LocationsData>[];
      json['data'].forEach((v) {
       data.add(LocationsData.fromJson(v));
      });
    }
  }
}

class LocationsData {
  int? id;
  String? city;
  String? country;
  String? address;
  String? title;
  String? notes;
  double? latitude;
  double? longitude;
  User? user;
  String? type;
  String? buildingNumber;
  String? floorNumber;


  LocationsData({
    this.id,
    this.city,
    this.country,
    this.address,
    this.title,
    this.notes,
    this.latitude,
    this.longitude,
    this.buildingNumber,
    this.floorNumber,
    this.user,
    this.type,
  });

  LocationsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    country = json['country'];
    address = json['address'];
    title = json['title'];
    notes = json['note'];
    latitude = json['latitude'] is int
        ? json['latitude'].toDouble():json['latitude'];
    longitude = json['longitude'] is int
        ? json['longitude'].toDouble():json['longitude'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    type = json['type'];
    buildingNumber = json["building_num"];
    floorNumber = json["floor_num"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['city'] = city;
    data['country'] = country;
    data['address'] = address;
    data['title'] = title;
    data['notes'] = notes;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    data['type'] = type;
    data["building_num"] = buildingNumber;
    data["floor_num"] = floorNumber;

    return data;
  }
}
