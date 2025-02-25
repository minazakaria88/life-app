import 'package:dartz/dartz.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/locations/data/models/location_model.dart';

abstract class LocationRepo {
  Future<Either<Failure,Locations>> getLocations();
  Future<Either<Failure,int>> postLocation({required Map<String,dynamic> map});
  Future<Either<Failure,int>> deleteLocation({required int id});
  Future<Either<Failure,int>> updateLocation({required Map<String,dynamic> map,required int id});

}