sealed class BrowseState {}

class BrowseInitial extends BrowseState {}

class GenreStateLoading extends BrowseState {}

class GenreStateSuccess extends BrowseState {}

class GenreStateError extends BrowseState {
  final String message;
  GenreStateError(this.message);
}