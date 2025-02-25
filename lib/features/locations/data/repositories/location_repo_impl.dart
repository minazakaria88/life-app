import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/locations/data/models/location_model.dart';
import 'package:life/features/locations/data/repositories/location_repo.dart';

import '../../../../core/api_helper/api_helper.dart';
import '../../../../core/api_helper/end_points.dart';

class LocationRepoImpl implements LocationRepo {
  final ApiHelper apiHelper;

  LocationRepoImpl({required this.apiHelper});

  @override
  Future<Either<Failure, Locations>> getLocations() async {
    try {
      var response = await apiHelper.getData(url: ApiEndPoints.locationData);
      return Right(Locations.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> postLocation(
      {required Map<String, dynamic> map}) async {
    try {
      var response = await apiHelper.postData(
        url: ApiEndPoints.locationData,
        data: map,
      );
      if(response.data['code']==0)
        {
          return Left(Failure(message: 'error'));
      }
      return Right(response.data['code']);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> deleteLocation({required int id})async {
    try {
      var response = await apiHelper.deleteData(url: '${ApiEndPoints.locationData}/$id');
      if(response.data['code']==0)
        {
          return Left(Failure(message: 'error'));
        }
      return Right(response.data['code']);
    }catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> updateLocation({required Map<String, dynamic> map, required int id})async {
   try
       {
         var response = await apiHelper.putData(url: '${ApiEndPoints.locationData}/$id', data: map);
         if(response.data['code']==0)
           {
             return Left(Failure(message: 'error'));
           }
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
