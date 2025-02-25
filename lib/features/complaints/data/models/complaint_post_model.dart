import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ComplaintPostModel {
  late final String title;
  late final String description;
  late final int type;
  late final int contractId;
  late final int priority;
  final XFile? file;

  ComplaintPostModel(
      {this.file,
      required this.title,
      required this.description,
      required this.type,
      required this.contractId,
      required this.priority});

  Future toJson() async {
    final data = FormData.fromMap({
      'name': title,
      'description': description,
      'type': type,
      'contract_id': contractId,
      'importance': priority,
      if (file != null)
        'file': await MultipartFile.fromFile(file!.path, filename: file!.name)
    });
    return data;
  }
}
