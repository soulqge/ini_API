class Film{
  int? id;
  String? title;
  double? voteAverage;
  String? overview;
  String? posterPath;

  Film(this.id, this.title, this.voteAverage, this.overview, this.posterPath);

  Film.fromJson(Map<String, dynamic> parsedJson){
    id = parsedJson['id'];
    title = parsedJson['title'];
    voteAverage = parsedJson['voteaverage']*1.0;
    overview = parsedJson['overview'];
    posterPath = parsedJson['posterpath'];
  }
}