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
  var rating;
  int page;

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    urlImage = complet + json['poster_path'];
    data = json['release_date'];
    rating = json['vote_average'];
    page = json['page'];
  }
}
