import 'package:dartz/dartz.dart';
import 'package:life/core/api_helper/failure.dart';
import 'package:life/features/notification/data/models/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<Failure,List<NotificationModel>>> getNotification({required int page});
}