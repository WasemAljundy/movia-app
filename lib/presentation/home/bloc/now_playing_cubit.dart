import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:netflix_app/presentation/home/bloc/now_playing_state.dart';
import 'package:netflix_app/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    var returnedData = await sl<GetNowPlayingMoviesUseCase>().call();
    returnedData.fold(
          (error) {
        emit(
          FailureLoadNowPlayingMovies(error),
        );
      },
          (data) {
        emit(
          NowPlayingMoviesLoaded(data),
        );
      },
    );
  }
}