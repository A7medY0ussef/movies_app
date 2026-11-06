sealed class SearchState {}

class SearchInitial extends SearchState {}

class SearchStateLoading extends SearchState {}

class SearchStateSuccess extends SearchState {}

class SearchStateError extends SearchState {
  final String message;
  SearchStateError(this.message);
}