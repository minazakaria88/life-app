import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:life/features/notification/data/models/notification_model.dart';
import 'package:life/features/notification/data/repositories/notification_repo.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit({required this.notificationRepo})
      : super(NotificationInitial());

  final NotificationRepo notificationRepo;

  List<NotificationModel> notifications = [];

  void getNotifications({required int page}) async {
    emit(GetNotificationLoadingState());
    var result = await notificationRepo.getNotification(page: page);
    result.fold((f) => emit(GetNotificationFailureState(message: f.message)),
        (r) {
      notifications.addAll(r);
      emit(GetNotificationSuccessState());
    });
  }

  void getMoreNotifications(ScrollController controller) async {
    int count = 2;
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        getNotifications(page: count++);
      }
    });
  }

  @override
  void emit(NotificationState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

}
