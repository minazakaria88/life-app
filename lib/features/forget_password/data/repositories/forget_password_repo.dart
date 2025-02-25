import 'package:dartz/dartz.dart';

import '../../../../core/api_helper/failure.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, int>> forgetPassword({required String phone});
  Future<Either<Failure, int>> resetPassword({
  required  Map data
  });
}
