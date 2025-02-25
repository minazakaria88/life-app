import 'package:dartz/dartz.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/login/data/models/login_model.dart';

abstract class LoginRepo {
  Future<Either<Failure,LoginModel>> login({required String phone,required String password});
  Future<Either<Failure,void>> logout();
  Future<Either<Failure,int>> verifyOtp({required String phone,required String otp,required String errorMsg});


}