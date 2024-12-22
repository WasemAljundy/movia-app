import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:netflix_app/presentation/home/bloc/trending_state.dart';
import 'package:netflix_app/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold(
      (error) {
        emit(
          FailureLoadTrendingMovies(error),
        );
      },
      (data) {
        emit(
          TrendingMoviesLoaded(data),
        );
      },
    );
  }
}
