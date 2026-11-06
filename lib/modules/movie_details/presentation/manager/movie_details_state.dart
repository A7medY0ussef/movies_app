import 'package:meta/meta.dart';
import 'package:movie_app/modules/movie_details/domain/entities/movie_details_entity.dart';

@immutable
sealed class MovieDetailsState {
  const MovieDetailsState();
}

final class MovieDetailsInitial extends MovieDetailsState {
  const MovieDetailsInitial();
}

final class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();
}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsEntity movie;
  const MovieDetailsSuccess(this.movie);
}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errorMessage;
  const MovieDetailsFailure(this.errorMessage);
}
