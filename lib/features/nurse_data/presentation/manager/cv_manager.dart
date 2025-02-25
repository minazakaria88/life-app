import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class CvManager with ChangeNotifier {
  String localPath='';
  bool isValidResume=true;

  void downloadPdf({required String resumeUrl}) async {
    try {
      final Dio dio = Dio(
        BaseOptions(
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout:  const Duration(seconds: 30),
        )
      );
      var dir = await getTemporaryDirectory();
      String tempPath = '${dir.path}/temp.pdf';
      await dio.download(resumeUrl, tempPath);
      localPath = tempPath;
      notifyListeners();
    } catch (e) {
      isValidResume=false;
      notifyListeners();
    }
  }
}
