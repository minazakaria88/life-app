import 'package:life/features/home/data/models/contract_nationality_model.dart';

class TicketPriorityModel
{
  late final int id;
  late final NameLang names;


  TicketPriorityModel({required this.id,required this.names});

}
List<TicketPriorityModel> ticketPriorities = [
  TicketPriorityModel(
    id: 1,
    names: NameLang(
      ar: "عالية",
      en: "High",
    ),
  ),
  TicketPriorityModel(
    id: 2,
    names: NameLang(
      ar: "متوسطة",
      en: "Medium",
    ),
  ),
  TicketPriorityModel(
    id: 3,
    names: NameLang(
      ar: "منخفضة",
      en: "Low",
    ),
  ),
];
