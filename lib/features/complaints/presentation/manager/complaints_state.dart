abstract class ComplaintsState {}

class ComplaintsInitial extends ComplaintsState {}

class ComplaintsLoading extends ComplaintsState {}

class ComplaintsSuccess extends ComplaintsState {}

class ComplaintsError extends ComplaintsState {
  final String message;
  ComplaintsError({required this.message});
}

class ComplaintsClearSuccess extends ComplaintsState {}


class AddComplaintsSuccess extends ComplaintsState {}

class AddComplaintsError extends ComplaintsState {
  final String message;
  AddComplaintsError({required this.message});
}

class AddComplaintsLoading extends ComplaintsState {}

class UploadFileSuccess extends ComplaintsState {}

class UploadFileError extends ComplaintsState {
  final String message;
  UploadFileError({required this.message});
}

class UploadFileLoading extends ComplaintsState {}


class PickFileSuccess extends ComplaintsState {}

class PickFileError extends ComplaintsState {
  final String message;
  PickFileError({required this.message});
}