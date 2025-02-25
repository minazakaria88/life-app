import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:life/core/api_helper/api_helper.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/forget_password/data/repositories/forget_password_repo.dart';

import '../../../../core/api_helper/end_points.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ApiHelper apiHelper;
  ForgetPasswordRepoImpl({required this.apiHelper});
  @override
  Future<Either<Failure, int>> forgetPassword({required String phone}) async {
    try {
      var response = await apiHelper
          .postData(url: ApiEndPoints.forgetPassword, data: {"phone": phone});
      if (response.data['code'] == 0) {
        return Left(Failure(message: response.data['message']));
      }
      return Right(response.data['code']);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(message: e.toString()));
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> resetPassword({required Map data}) async {
    try {
      var response =
          await apiHelper.postData(url: ApiEndPoints.resetPassword, data: data);
      if (response.data['code'] == 0) {
        return Left(Failure(message: response.data['message']));
      }
      return Right(response.data['code']);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }
}
