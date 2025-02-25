import 'package:dartz/dartz.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/order/data/models/branches_model.dart';
import 'package:life/features/order/data/models/cities_model.dart';
import 'package:life/features/order/data/models/package_model.dart';

import '../../../locations/data/models/location_model.dart';

abstract class OrderRepo {
  Future<Either<Failure,CitiesModel>> getCities();
  Future<Either<Failure,BranchesModel>> getBranches();
  Future<Either<Failure,Locations>> getLocations();
  Future<Either<Failure,Packages>> getPackages({required int id});
  Future<Either<Failure,int>> makeOrder(Map<String,dynamic> data);

}