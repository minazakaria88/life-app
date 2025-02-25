abstract class SearchState {}

class SearchInitState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {}

class SearchFailureState extends SearchState {
  final String message;
  SearchFailureState({required this.message});
}