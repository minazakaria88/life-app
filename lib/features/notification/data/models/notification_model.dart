class NotificationModel {


  late final String id;
  late final String type;
  late final NotificationData data;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    data = NotificationData.fromJson(json['data']);
  }
}

class NotificationData {
  late final String title;
  late final String message;

  NotificationData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
  }
}
