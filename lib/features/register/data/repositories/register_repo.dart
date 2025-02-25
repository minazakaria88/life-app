import 'package:dartz/dartz.dart';
import 'package:life/features/login/data/models/login_model.dart';

import '../../../../core/api_helper/failure.dart';
import '../models/register_model.dart';

abstract class RegisterRepo{

  Future<Either<Failure, LoginModel>> register({
   required RegisterModel model
  });

}