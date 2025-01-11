import 'package:netflix_app/core/entity/trailer.dart';
import 'package:netflix_app/core/models/trailer.dart';

class TrailerMapper {
  static TrailerEntity toEntity(TrailerModel trailerModel) {
    return TrailerEntity(
      adult: trailerModel.adult,
      backdropPath: trailerModel.backdropPath,
      budget: trailerModel.budget,
      homepage: trailerModel.homepage,
      id: trailerModel.id,
      imdbId: trailerModel.imdbId,
      originCountry: trailerModel.originCountry,
      originalLanguage: trailerModel.originalLanguage,
      originalTitle: trailerModel.originalTitle,
      overview: trailerModel.overview,
      popularity: trailerModel.popularity,
      posterPath: trailerModel.posterPath,
      releaseDate: trailerModel.releaseDate,
      revenue: trailerModel.revenue,
      runtime: trailerModel.runtime,
      status: trailerModel.status,
      tagline: trailerModel.tagline,
      title: trailerModel.title,
      video: trailerModel.video,
      voteAverage: trailerModel.voteAverage,
      voteCount: trailerModel.voteCount,
    );
  }
}
