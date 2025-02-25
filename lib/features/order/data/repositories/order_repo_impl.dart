import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:life/core/api_helper/failure.dart';

import 'package:life/features/order/data/models/cities_model.dart';
import 'package:life/features/order/data/models/package_model.dart';

import '../../../../core/api_helper/api_helper.dart';
import '../../../../core/api_helper/end_points.dart';
import '../../../locations/data/models/location_model.dart';
import '../models/branches_model.dart';
import 'order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final ApiHelper apiHelper;

  OrderRepoImpl({required this.apiHelper});
  @override
  Future<Either<Failure, CitiesModel>> getCities() async {
    try {
      var response = await apiHelper.getData(url: ApiEndPoints.cities);

      return Right(CitiesModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BranchesModel>> getBranches() async {
    try {
      var response = await apiHelper.getData(url: ApiEndPoints.branches);
      return Right(BranchesModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

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
  Future<Either<Failure, Packages>> getPackages({required int id}) async {
    try {
      var response = await apiHelper.getData(url: '${ApiEndPoints.packages}/$id');
      return Right(Packages.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> makeOrder(Map<String,dynamic> data) async{
    try
        {
          var response=await apiHelper.postData(url: ApiEndPoints.contract,data: data);
          return Right(response.data['code']);
        }
        catch(e)
        {
          if (e is DioException) {
            return Left(ServerFailure.serverError(e));
          }
          return Left(Failure(message: e.toString()));
        }
  }
}
