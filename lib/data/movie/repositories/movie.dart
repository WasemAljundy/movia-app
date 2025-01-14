import 'package:dartz/dartz.dart';
import 'package:netflix_app/common/helpers/mapper/movie_mapper.dart';
import 'package:netflix_app/common/helpers/mapper/trailer_mapper.dart';
import 'package:netflix_app/core/models/trailer.dart';
import 'package:netflix_app/data/movie/models/movie.dart';
import 'package:netflix_app/data/movie/sources/movie.dart';
import 'package:netflix_app/domain/movie/repositories/movie.dart';
import 'package:netflix_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();
    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var movies = List.from(data['results'])
            .map(
              (item) => MovieMapper.toEntity(MovieModel.fromJson(item)),
            )
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();
    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var movies = List.from(data['results'])
            .map(
              (item) => MovieMapper.toEntity(MovieModel.fromJson(item)),
            )
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var returnedData = await sl<MovieService>().getMovieTrailer(movieId);
    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var movie = TrailerMapper.mapToEntity(TrailerModel.fromJson(data));
        return Right(movie);
      },
    );
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var returnedData =
        await sl<MovieService>().getRecommendationMovies(movieId);
    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var movies = List.from(data['results'])
            .map(
              (item) => MovieMapper.toEntity(MovieModel.fromJson(item)),
            )
            .toList();
        return Right(movies);
      },
    );
  }
}
