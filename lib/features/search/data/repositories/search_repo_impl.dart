import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/nurse_data/data/models/nurse_data_model.dart';
import 'package:life/features/search/data/repositories/search_repo.dart';

import '../../../../core/api_helper/api_helper.dart';
import '../../../../core/api_helper/end_points.dart';

class SearchRepoImpl implements SearchRepo {

  final ApiHelper apiHelper;


  SearchRepoImpl({required this.apiHelper});
  @override
  Future<Either<Failure, List<NurseDataModel>>> search({required String query,required int page})async {
    List<NurseDataModel> list = [];
    try
        {
          var response=await apiHelper.getData(url: ApiEndPoints.search,query: {'name':query,'page':page});
          response.data['data']['data'].forEach((element) {
            list.add(NurseDataModel.fromJson(element));
          });
          return Right(list);
        }catch(e)
    {
      if(e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }

}