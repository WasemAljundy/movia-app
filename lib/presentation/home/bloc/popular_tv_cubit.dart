import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:netflix_app/presentation/home/bloc/popular_tv_state.dart';
import 'package:netflix_app/service_locator.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvLoading());

  void getPopularTv() async {
    var returnedData = await sl<GetPopularTvUseCase>().call();
    returnedData.fold(
      (error) {
        emit(
          FailureLoadPopularTv(error),
        );
      },
      (data) {
        emit(
          PopularTvLoaded(data),
        );
      },
    );
  }
}
