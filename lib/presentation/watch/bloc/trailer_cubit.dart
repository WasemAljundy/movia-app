import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/entity/trailer.dart';
import 'package:netflix_app/domain/movie/repositories/movie.dart';
import 'package:netflix_app/presentation/watch/bloc/trailer_state.dart';
import 'package:netflix_app/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<MovieRepository>().getMovieTrailer(movieId);
    returnedData.fold(
      (error) {
        emit(
          LoadFailureTrailer(errorMessage: error),
        );
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.id.toString(),
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        );
        emit(
          TrailerLoaded(youtubePlayerController: controller),
        );
      },
    );
  }
}
