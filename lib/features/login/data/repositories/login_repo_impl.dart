import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/login/data/models/login_model.dart';
import 'package:life/features/login/data/repositories/login_repo.dart';
import '../../../../core/api_helper/api_helper.dart';
import '../../../../core/api_helper/end_points.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiHelper apiHelper;

  LoginRepoImpl({required this.apiHelper});

  @override
  Future<Either<Failure, LoginModel>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await apiHelper.postData(
        url: ApiEndPoints.login,
        data: {
          "phone": phone,
          "password": password,
        },
      );

      if (response.data != null && response.data['code'] == 0) {
        return Left(
            Failure(message: response.data['message'] ?? 'Unknown error'));
      }
      return Right(LoginModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: 'An error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await apiHelper.postData(
        url: ApiEndPoints.logout,
      );
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: 'An error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, int>> verifyOtp(
      {required String phone, required String otp,required String errorMsg}) async {
    try {
      var response = await apiHelper.postData(
          url: ApiEndPoints.verifyOtp, data: {"phone": phone, "otp": otp});
      if (response.data['code'] == 0) {
        return Left(Failure(
            message:errorMsg),);
      }
      return Right(response.data['code']);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: 'An error occurred: ${e.toString()}'));
    }
  }
}
