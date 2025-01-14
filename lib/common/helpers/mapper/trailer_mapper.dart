import 'package:netflix_app/core/entity/trailer.dart';
import 'package:netflix_app/core/models/trailer.dart';

class TrailerMapper {
  static TrailerEntity mapToEntity(TrailerModel model) {
    return TrailerEntity(
      id: model.id ?? 0,  // provide a default value in case id is null
      results: model.results.map((result) => ResultMapper.mapToEntity(result)).toList(),
    );
  }
}

class ResultMapper {
  static ResultEntity mapToEntity(Result result) {
    return ResultEntity(
      iso6391: result.iso6391 ?? "",
      iso31661: result.iso31661 ?? "",
      name: result.name ?? "",
      key: result.key ?? "",
      site: result.site ?? "",
      size: result.size ?? 0,
      type: result.type ?? "",
      official: result.official ?? false,
      publishedAt: result.publishedAt ?? DateTime(1970, 1, 1),
      id: result.id ?? "",
    );
  }
}
