import 'package:dartz/dartz.dart';
import 'package:netflix_app/common/helpers/mapper/tv_mapper.dart';
import 'package:netflix_app/data/tv/models/tv.dart';
import 'package:netflix_app/data/tv/sources/tv.dart';
import 'package:netflix_app/domain/tv/repositories/tv.dart';
import 'package:netflix_app/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTV() async {
    var returnedData = await sl<TvService>().getPopularTv();
    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var movies = List.from(data['results'])
            .map(
              (item) => TvMapper.toEntity(TVModel.fromJson(item)),
            )
            .toList();
        return Right(movies);
      },
    );
  }
}
