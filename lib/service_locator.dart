
import 'package:get_it/get_it.dart';
import 'package:netflix_app/core/network/dio_client.dart';
import 'package:netflix_app/data/auth/repositories/auth.dart';
import 'package:netflix_app/data/auth/sources/auth_api_service.dart';
import 'package:netflix_app/data/movie/repositories/movie.dart';
import 'package:netflix_app/data/movie/sources/movie.dart';
import 'package:netflix_app/data/tv/repositories/tv.dart';
import 'package:netflix_app/data/tv/sources/tv.dart';
import 'package:netflix_app/domain/auth/repositories/auth.dart';
import 'package:netflix_app/domain/auth/usecases/is_logged_in.dart';
import 'package:netflix_app/domain/auth/usecases/sign_in.dart';
import 'package:netflix_app/domain/movie/repositories/movie.dart';
import 'package:netflix_app/domain/movie/usecases/get_movie_trailer.dart';
import 'package:netflix_app/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:netflix_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:netflix_app/domain/tv/repositories/tv.dart';
import 'package:netflix_app/domain/tv/usecases/get_popular_tv.dart';

import 'domain/auth/usecases/sign_up.dart';
import 'domain/movie/usecases/get_now_playing_movies.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<DioClient>(DioClient());

  // services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TvService>(TvApiServiceImpl());

  // repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TvRepository>(TvRepositoryImpl());

  // usecases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetRecommendationMoviesUseCase>(GetRecommendationMoviesUseCase());
}