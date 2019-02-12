import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  static const String IMAGE_BASE_URL = 'https://image.tmdb.org/t/p/';

  @JsonKey(name: 'vote_count')
  int voteCount;
  int id;
  bool video;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  String title;
  double popularity;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  bool adult;
  String overview;
  @JsonKey(name: 'release_date')
  String releaseDate;

  Movie(this.voteCount, this.id, this.video, this.voteAverage, this.title, this.popularity,
      this.posterPath, this.originalLanguage, this.originalTitle, this.genreIds,
      this.backdropPath, this.adult, this.overview, this.releaseDate);

  String getBackdropImageUrl({BackdropSize size = BackdropSize.W780}) {
    return IMAGE_BASE_URL + size.value + "/" + backdropPath;
  }

  String getPosterImageUrl({PosterSize size = PosterSize.W500}) {
    return IMAGE_BASE_URL + size.value + "/" + posterPath;
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  String toString() {
    return 'Movie{vote_count: $voteCount, id: $id, video: $video, vote_average: $voteAverage, '
        'title: $title, popularity: $popularity, poster_path: $posterPath, '
        'original_language: $originalLanguage, original_title: $originalTitle, '
        'genre_ids: $genreIds, backdrop_path: $backdropPath, adult: $adult, overview: $overview, '
        'release_date: $releaseDate}';
  }
}

class BackdropSize {
  final value;
  const BackdropSize._internal(this.value);
  toString() => 'Enum.$value';

  static const W300 = const BackdropSize._internal('w300');
  static const W780 = const BackdropSize._internal('w780');
  static const W1280 = const BackdropSize._internal('w1280');
  static const ORIGINAL = const BackdropSize._internal('original');
}

class PosterSize {
  final value;
  const PosterSize._internal(this.value);
  toString() => 'Enum.$value';

  static const W92 = const PosterSize._internal('w92');
  static const W154 = const PosterSize._internal('w154');
  static const W185 = const PosterSize._internal('w185');
  static const W342 = const PosterSize._internal('w342');
  static const W500 = const PosterSize._internal('w500');
  static const W780 = const PosterSize._internal('w780');
}