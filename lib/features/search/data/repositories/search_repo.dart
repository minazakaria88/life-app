import 'package:dartz/dartz.dart';
import 'package:life/features/nurse_data/data/models/nurse_data_model.dart';

import '../../../../core/api_helper/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<NurseDataModel>>> search({required String query,required int page});
}