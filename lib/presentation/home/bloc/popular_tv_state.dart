import 'package:netflix_app/domain/tv/entities/tv.dart';

abstract class PopularTvState {}

class PopularTvLoading extends PopularTvState {}

class PopularTvLoaded extends PopularTvState {
  final List<TvEntity> tvs;

  PopularTvLoaded(this.tvs);
}

class FailureLoadPopularTv extends PopularTvState {
  final String errorMessage;

  FailureLoadPopularTv(this.errorMessage);
}
