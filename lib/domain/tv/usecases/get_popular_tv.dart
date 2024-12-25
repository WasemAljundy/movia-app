import 'package:dartz/dartz.dart';
import 'package:netflix_app/core/usecase/usecase.dart';
import 'package:netflix_app/domain/tv/repositories/tv.dart';
import 'package:netflix_app/service_locator.dart';

class GetPopularTvUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TvRepository>().getPopularTV();
  }
}
