class DelegationPostModel
{
  final String name;
  final String iqama;
  final int nationality;
  final String phone;
  final int status;



  DelegationPostModel(
    {
      required this.name,
      required this.iqama,
      required this.nationality,
      required this.phone,
      required this.status
    }
  );



  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['iqama'] = iqama;
    data['nationality_id'] = nationality;
    data['phone'] = phone;
    data['status'] = status;
    return data;
  }
}