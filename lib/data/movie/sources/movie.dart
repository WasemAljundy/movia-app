import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_app/core/constants/api_url.dart';
import 'package:netflix_app/core/network/dio_client.dart';
import 'package:netflix_app/service_locator.dart';

abstract class MovieService {

  Future<Either> getTrendingMovies();
}


class MovieApiService extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try{
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }
}