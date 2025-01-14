import 'package:netflix_app/domain/movie/entities/movie.dart';

abstract class RecommendationMoviesState {}

class RecommendationMoviesLoading extends RecommendationMoviesState {}

class RecommendationMoviesLoaded extends RecommendationMoviesState {
  final List<MovieEntity> movies;

  RecommendationMoviesLoaded(this.movies);
}

class FailureLoadRecommendationMovies extends RecommendationMoviesState {
  final String errorMessage;

  FailureLoadRecommendationMovies(this.errorMessage);
}
