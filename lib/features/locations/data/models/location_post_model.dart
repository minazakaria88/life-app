class LocationPostModel {
  late final String address;
  late final String city;
  late final String country;
  late final double latitude;
  late final double longitude;
  late final String title;
  late final String notes;
  late final String type;
  late final String buildingNumber;
  late final String floorNumber;

  LocationPostModel({
    required this.address,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.notes,
    required this.type,
    required this.buildingNumber,
    required this.floorNumber,
    required this.country
  });


  LocationPostModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    title = json['title'];
    notes = json['notes'];
    type = json['type'];
    buildingNumber = json['building_num'];
    floorNumber = json['floor_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['city'] = 'الرياض';
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['title'] = title;
    data['notes'] = notes;
    data['type'] = type;
    data['building_num'] = buildingNumber;
    data['floor_num'] = floorNumber;
    data['country'] = country;
    return data;
  }


}
