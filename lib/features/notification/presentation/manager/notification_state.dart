abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class GetNotificationSuccessState extends NotificationState {}

class GetNotificationFailureState extends NotificationState {
  final String message;
  GetNotificationFailureState({required this.message});
}

class GetNotificationLoadingState extends NotificationState {}