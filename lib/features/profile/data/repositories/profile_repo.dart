import 'package:dartz/dartz.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/profile/data/models/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure,ProfileModel>> getProfile();
  Future<Either<Failure,int>> updateProfile({required Map data});
  Future<Either<Failure,int>> removeAccount();
}