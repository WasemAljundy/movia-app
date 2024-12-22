
import 'package:get_it/get_it.dart';
import 'package:netflix_app/core/network/dio_client.dart';
import 'package:netflix_app/data/auth/repositories/auth.dart';
import 'package:netflix_app/data/auth/sources/auth_api_service.dart';
import 'package:netflix_app/data/movie/repositories/movie.dart';
import 'package:netflix_app/data/movie/sources/movie.dart';
import 'package:netflix_app/domain/auth/repositories/auth.dart';
import 'package:netflix_app/domain/auth/usecases/is_logged_in.dart';
import 'package:netflix_app/domain/auth/usecases/sign_in.dart';
import 'package:netflix_app/domain/movie/repositories/movie.dart';
import 'package:netflix_app/domain/movie/usecases/get_trending_movies.dart';

import 'domain/auth/usecases/sign_up.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<DioClient>(DioClient());

  // services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiService());

  // repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  // usecases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
}