import 'package:dio/dio.dart';
import 'package:life/core/api_helper/end_points.dart';

import '../helpers/cache_helper.dart';

class ApiHelper {
  static Dio? dio;


  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.baseUrl = ApiEndPoints.baseUrl
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      dio!.interceptors.add(LogInterceptor());
      addDioHeaders();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Accept-Language': CacheHelper.getData(key: CacheHelperKeys.lang) ?? 'ar',
      'Authorization':
          'Bearer ${await CacheHelper.getSecureString(CacheHelperKeys.token)}',
    };
  }


  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  Future<Response> postData({
    required String url,
    var data,
  }) async {
    return await dio!.post(
      url,
      data: data,
    );
  }

  Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.put(url, data: data);
  }

  Future<Response> deleteData({
    required String url,
  }) async {
    return await dio!.delete(url);
  }

  void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  void setLangIntoHeader(String lang) {
    dio?.options.headers['Accept-Language'] = lang;
  }


}
