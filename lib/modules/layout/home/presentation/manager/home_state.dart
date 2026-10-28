part of 'home_cubit.dart';

@immutable
sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeSuccess extends HomeState {
  final List<MovieEntity> actionMovies;
  final List<MovieEntity> availableNow;
  const HomeSuccess({required this.actionMovies, required this.availableNow});
}

final class HomeFailure extends HomeState {
  final String errorMessage;
  const HomeFailure(this.errorMessage);
}
