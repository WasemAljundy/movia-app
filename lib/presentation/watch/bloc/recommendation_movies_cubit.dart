import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:netflix_app/presentation/watch/bloc/recommendation_movies_state.dart';
import 'package:netflix_app/service_locator.dart';

class RecommendationMoviesCubit extends Cubit<RecommendationMoviesState> {
  RecommendationMoviesCubit() : super(RecommendationMoviesLoading());

  void getRecommendationMovies(int movieId) async {
    var returnedData =
        await sl<GetRecommendationMoviesUseCase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(
          FailureLoadRecommendationMovies(error),
        );
      },
      (data) {
        emit(
          RecommendationMoviesLoaded(data),
        );
      },
    );
  }
}
