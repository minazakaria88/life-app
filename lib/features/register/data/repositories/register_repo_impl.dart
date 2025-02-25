import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/login/data/models/login_model.dart';
import 'package:life/features/register/data/models/register_model.dart';
import 'package:life/features/register/data/repositories/register_repo.dart';
import '../../../../core/api_helper/api_helper.dart';
import '../../../../core/api_helper/end_points.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiHelper apiHelper;

  RegisterRepoImpl({required this.apiHelper});

  @override
  Future<Either<Failure, LoginModel>> register(
      {required RegisterModel model}) async {
    try {
      var response = await apiHelper.postData(
        url: ApiEndPoints.register,
        data: model.toJson(),
      );
      if (response.data['code'] == 0) {
        return Left(Failure(
            message: validateResponseError(response.data['data']).isEmpty
                ? response.data['message']
                : validateResponseError(response.data['data'])));
      }
      return Right(LoginModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

  String validateResponseError(Map<String, dynamic> data) {
    String message = '';
    if (data['name'] != null) {
      message += data['name'][0];
      //message += '\n';
    }
    if (data['email'] != null) {
      message += data['email'][0];
      message += '\n';
    }
    if (data['phone'] != null) {
      message += data['phone'][0];
      message += '\n';
    }
    if (data['iqama'] != null) {
      message += data['iqama'][0];
      message += '\n';
    }
    if (data['password'] != null) {
      message += data['password'][0];
      message += '\n';
    }
    return message;
  }
}
