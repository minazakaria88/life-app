import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/home/data/models/contract_nationality_model.dart';
import 'package:life/features/home/data/repositories/home_repo.dart';
import 'package:life/features/nurse_data/data/models/contract_model.dart';
import 'package:life/features/nurse_data/data/models/nurse_data_model.dart';

import '../../../../core/api_helper/api_helper.dart';
import '../../../../core/api_helper/end_points.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiHelper apiHelper;
  HomeRepoImpl({required this.apiHelper});
  @override
  Future<Either<Failure, List<ContractNationalityModel>>>
      getContractNationality() async {
    List<ContractNationalityModel> list = [];
    try {
      var response = await apiHelper.getData(url: ApiEndPoints.getContractsNationality);
      response.data['data'].forEach((element) {
        list.add(ContractNationalityModel.fromJson(element));
      });
      return Right(list);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Contracts>> getContracts()async {
    try {
      var response=await apiHelper.getData(url: ApiEndPoints.orderHistory);
      if(response.data['code']==0)
        {
          return Left(Failure(message: 'Sorry Can\'t fetch contracts'));
        }
      return Right(Contracts.fromJson(response.data));
    }catch(e){
      if(e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, NurseModel>> getFilterNurseData({required Map<String, dynamic> query,})async {
    try {
      var response=await apiHelper.getData(url: ApiEndPoints.filterNurseData,query: query);
      return Right(NurseModel.fromJson(response.data));
    }catch(e){
      if(e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }

  }
}
