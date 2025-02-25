import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:life/core/api_helper/api_helper.dart';
import 'package:life/core/api_helper/end_points.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/profile/data/models/profile_model.dart';
import 'package:life/features/profile/data/repositories/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiHelper apiHelper;

  ProfileRepoImpl({required this.apiHelper});
  @override
  Future<Either<Failure, ProfileModel>> getProfile()async {
   try
       {
         var response=await apiHelper.getData(url: ApiEndPoints.profile);
         return Right(ProfileModel.fromJson(response.data));
       }catch(e)
       {
         if(e is DioException) {
           return Left(ServerFailure.serverError(e));
         }
         return Left(Failure(message: e.toString()));
       }
  }

  @override
  Future<Either<Failure, int>> removeAccount() {
    // TODO: implement removeAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> updateProfile({required Map data})async {
    try
        {
          var response=await apiHelper.putData(url: ApiEndPoints.profile,data: data as Map<String,dynamic>);

          if(response.data['code']==0)
            {
               if(response.data['error']['name']!=null)
                 {
                   return Left(Failure(message: response.data['error']['name'][0]));
                 }
            }
          return Right(response.data['code']);
        }catch(e)
    {
      if(e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

}