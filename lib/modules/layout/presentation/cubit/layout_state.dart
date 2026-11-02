sealed class LayoutState {}

class ChangeScreen extends LayoutState{}
class ChangeGenre extends LayoutState{}
class LayoutInitial extends LayoutState {}

class SearchStateLoading extends LayoutState {}

class SearchStateSuccess extends LayoutState {}

class SearchStateError extends LayoutState {
  final String message;
  SearchStateError(this.message);
}

class GenreStateLoading extends LayoutState {}

class GenreStateSuccess extends LayoutState {}

class GenreStateError extends LayoutState {
  final String message;
  GenreStateError(this.message);
}
