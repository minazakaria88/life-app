import 'dart:convert';

class LoginModel {
  late final int code;
  late final String message;
  late final Data? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  late final String token;
  late final String name;
  late final String email;
  late final String iqama;
  late final String phone;

  Data(
      {required this.token,
      required this.name,
      required this.email,
      required this.iqama,
      required this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    email = json['email'];
    iqama = json['iqama'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['name'] = name;
    data['email'] = email;
    data['iqama'] = iqama;
    data['phone'] = phone;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}
