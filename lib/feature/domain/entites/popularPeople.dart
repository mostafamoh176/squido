import 'package:equatable/equatable.dart';

class PopularPeople extends Equatable {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PopularPeople({this.page, this.results, this.totalPages, this.totalResults});

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}

class Results extends Equatable {
  bool? adult;
  int? gender;
  int? id;
  List<KnownFor>? knownFor;
  String? knownForDepartment;
  String? name;
  double? popularity;
  String? profilePath;

  Results(
      {this.adult,
      this.gender,
      this.id,
      this.knownFor,
      this.knownForDepartment,
      this.name,
      this.popularity,
      this.profilePath});

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownFor,
        knownForDepartment,
        name,
        popularity,
        profilePath,
      ];
}

class KnownFor extends Equatable {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? mediaType;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? firstAirDate;
  String? name;
  List<String>? originCountry;
  String? originalName;

  KnownFor(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.firstAirDate,
      this.name,
      this.originCountry,
      this.originalName});

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        mediaType,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        firstAirDate,
        name,
        originCountry,
        originalName
      ];
}
