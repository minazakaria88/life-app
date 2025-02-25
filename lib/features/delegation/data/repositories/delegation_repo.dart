import 'package:dartz/dartz.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/delegation/data/models/delegation_model.dart';
import 'package:life/features/home/data/models/contract_nationality_model.dart';

abstract class DelegationRepo {
  Future<Either<Failure,Delegations>> getDelegations();
  Future<Either<Failure,int>> deleteDelegation({required int id});
  Future<Either<Failure,int>> updateDelegation({required int id,required Map<String,dynamic> map});
  Future<Either<Failure,int>> postDelegation({required Map<String,dynamic> map});
  Future<Either<Failure,List<ContractNationalityModel>>> getContractNationality();
}