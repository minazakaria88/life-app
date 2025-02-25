class ContractNationalityModel
{
 late final int id;
 late final NameLang names;

 ContractNationalityModel({required this.id,required this.names});

  ContractNationalityModel.fromJson(Map<String ,dynamic> json)
  {
    id=json['id'];
    names=NameLang.fromJson(json['name']);
  }

}

class NameLang
{
  late final String ar;
   late  final String en;

   NameLang({
     required this.ar,
     required this.en
   });

  NameLang.fromJson(Map<String ,dynamic> json)
  {
    ar=json['ar'];
    en=json['en'];
  }


}