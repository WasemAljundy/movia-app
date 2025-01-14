class TrailerEntity {
  final int id;
  final List<ResultEntity> results;

  TrailerEntity({
    required this.id,
    required this.results,
  });
}

class ResultEntity {
  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final DateTime publishedAt;
  final String id;

  ResultEntity({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });
}
