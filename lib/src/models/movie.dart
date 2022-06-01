class Movie {
  late int id;
  late String title;
  late double voteAverage;
  late String releaseDate;
  late String overview;
  late String posterPath;

  Movie(this.id, this.title, this.voteAverage, this.releaseDate, this.overview,
      this.posterPath);

  Movie.fromJson(Map<String, dynamic> parseJson){
    this.id = parseJson['id'];
    this.title = parseJson['title'];
    this.voteAverage = parseJson['vote_average']*1.0;
    this.releaseDate = parseJson['release_date'];
    this.overview = parseJson['overview'];
    this.posterPath = parseJson['poster_path'];
  }
}
