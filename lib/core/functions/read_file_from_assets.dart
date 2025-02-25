import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String,dynamic>> writeOnFile({required String path})async {
  String jsonString = await rootBundle.loadString(path);
  var jsonData=jsonDecode(jsonString);
  return jsonData;
}