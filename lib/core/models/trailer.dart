class TrailerModel {
  TrailerModel({
    required this.id,
    required this.results,
  });

  final int? id;
  final List<Result> results;

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      id: json["id"],
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  Result({
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

  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      iso6391: json["iso_639_1"],
      iso31661: json["iso_3166_1"],
      name: json["name"],
      key: json["key"],
      site: json["site"],
      size: json["size"],
      type: json["type"],
      official: json["official"],
      publishedAt: DateTime.tryParse(json["published_at"] ?? ""),
      id: json["id"],
    );
  }
}
