import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:life/core/api_helper/api_helper.dart';

import 'package:life/core/api_helper/failure.dart';

import 'package:life/features/mediation/data/models/mediation_model.dart';

import '../../../../core/api_helper/end_points.dart';
import 'mediation_repo.dart';

class MediationRepoImpl implements MediationRepo{
  final ApiHelper apiHelper;

  MediationRepoImpl({required this.apiHelper});

  @override
  Future<Either<Failure, MediationModel>> getMediation({required int page})async {
    try
        {
          var response=await apiHelper.getData(url: ApiEndPoints.mediation,query: {'page':page,});
          return Right(MediationModel.fromJson(response.data));
        }catch(e)
        {
          if(e is DioException)
          {
            return Left(ServerFailure.serverError(e));
          }
          return Left(Failure(message: e.toString()));
        }
  }

  @override
  Future<Either<Failure, int>> postMediation({required Map<String, dynamic> map})async {
    try
        {
          var response=await apiHelper.postData(url: ApiEndPoints.mediation, data: map);
          return Right(response.data['code']);
        }catch(e)
    {
      if(e is DioException)
      {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

}