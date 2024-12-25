import 'package:netflix_app/domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesLoaded extends NowPlayingState {
  final List<MovieEntity> movies;

  NowPlayingMoviesLoaded(this.movies);
}

class FailureLoadNowPlayingMovies extends NowPlayingState {
  final String errorMessage;

  FailureLoadNowPlayingMovies(this.errorMessage);
}
