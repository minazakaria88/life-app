import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:life/core/api_helper/api_helper.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/delegation/data/models/delegation_model.dart';
import 'package:life/features/delegation/data/repositories/delegation_repo.dart';
import 'package:life/features/home/data/models/contract_nationality_model.dart';

import '../../../../core/api_helper/end_points.dart';

class DelegationRepoImpl implements DelegationRepo
{
  final ApiHelper apiHelper;

  DelegationRepoImpl({required this.apiHelper});
  @override
  Future<Either<Failure, Delegations>> getDelegations()async {
   try
       {
         var response=await apiHelper.getData(url: ApiEndPoints.delegations);
         return Right(Delegations.fromJson(response.data));
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
  Future<Either<Failure, int>> deleteDelegation({required int id})async {
    try
    {
      var response=await apiHelper.deleteData(url: '${ApiEndPoints.delegations}/$id');
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

  @override
  Future<Either<Failure, int>> updateDelegation({required int id, required Map<String, dynamic> map})async {
   try
       {
         var response=await apiHelper.putData(url: '${ApiEndPoints.delegations}/$id', data: map);
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

  @override
  Future<Either<Failure, int>> postDelegation({required Map<String, dynamic> map}) async{
    try
    {
      var response=await apiHelper.postData(url: ApiEndPoints.delegations, data: map);
      if(response.data['code']==0)
        {
          return Left(Failure(message: response.data['message']));
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

  @override
  Future<Either<Failure, List<ContractNationalityModel>>> getContractNationality() async{
    List<ContractNationalityModel> nationalities=[];
    try
    {
      var response=await apiHelper.getData(url: ApiEndPoints.nationalities);
      response.data['data'].forEach((element) {
        nationalities.add(ContractNationalityModel.fromJson(element));
      });
      return Right(nationalities);
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

