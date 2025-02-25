import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:life/core/api_helper/api_helper.dart';

import 'package:life/core/api_helper/failure.dart';

import 'package:life/features/complaints/data/models/complaint_model.dart';

import 'package:life/features/complaints/data/models/complaint_post_model.dart';

import '../../../../core/api_helper/end_points.dart';
import 'complaint_repo.dart';

class ComplaintRepoImpl extends ComplaintRepo {
  final ApiHelper apiHelper;

  ComplaintRepoImpl({required this.apiHelper});
  @override
  Future<Either<Failure, int>> addComplaints(
      {required ComplaintPostModel model}) async {
    try {
      var response = await apiHelper.postData(
          url: ApiEndPoints.addComplaint, data: await model.toJson());
      if(response.data['code'] == 0){
        return Left(Failure(message: response.data['message']));
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
  Future<Either<Failure, Complaints>> getComplaints() async {
    try {
      var response = await apiHelper.getData(url: ApiEndPoints.complaints);
      if (response.data['code'] == 0) {
        return Left(Failure(message: 'unknown error'));
      }
      return Right(Complaints.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.serverError(e));
      }
      return Left(Failure(message: e.toString()));
    }
  }
}
