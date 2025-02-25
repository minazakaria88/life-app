class RegisterModel
{
  late final String name;
  late final String email;
  late final String password;
  late final String iqama;
  late final String phone;
  late final String deviceToken;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.iqama,
    required this.phone,
    required this.deviceToken
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    iqama = json['iqama'];
    phone = json['phone'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['iqama'] = iqama;
    data['phone'] = phone;
    data['device_token'] = deviceToken;
    return data;
  }

}