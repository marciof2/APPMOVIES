class Movie {
  List<Results> movies;

  Movie.fromJson(Map<String, dynamic> json) {
    var arrayMovie = json['results'] as List;

    movies = arrayMovie.map((item) {
      return Results.fromJson(item);
    }).toList();
  }
}

class Results {
  String complet = 'https://image.tmdb.org/t/p/w300';
  String title;
  String urlImage;
  String data;

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    urlImage = json['https://image.tmdb.org/t/p/w300' + 'poster_path'];
    data = json['release_date'];
  }
}
