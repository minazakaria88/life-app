import 'package:dartz/dartz.dart';

import '../../../../core/api_helper/failure.dart';
import '../models/mediation_model.dart';

abstract class  MediationRepo
{
  Future<Either<Failure,MediationModel>> getMediation({required int page});
  Future<Either<Failure,int>> postMediation({required Map<String,dynamic> map});
}