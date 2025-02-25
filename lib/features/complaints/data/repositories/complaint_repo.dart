import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/complaints/data/models/complaint_model.dart';
import 'package:dartz/dartz.dart';

import '../models/complaint_post_model.dart';

abstract class ComplaintRepo {

  Future<Either<Failure,Complaints>> getComplaints();
  Future<Either<Failure,int>> addComplaints({required ComplaintPostModel model});

}