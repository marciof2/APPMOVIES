class Lancamentos {
  List<UpComingMovies>? upcomingMovies;

  Lancamentos.fromJson(Map<String, dynamic> json) {
    var arrayMovie = json['results'] as List;

    upcomingMovies = arrayMovie.map((item) {
      return UpComingMovies.fromJson(item);
    }).toList();
  }

  int? get id => null;

  set isFavorite(bool isFavorite) {}
}

class UpComingMovies {
  String? complet = 'https://image.tmdb.org/t/p/w300';
  String? title;
  String? urlImage;
  String? data;
  String? resumo;
  var id;
  var rating;
  bool? isFavorite = false;
  UpComingMovies({this.isFavorite});

  UpComingMovies.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    urlImage = json['poster_path'];
    data = json['release_date'];
    rating = json['vote_average'];
    resumo = json['overview'];
    id = json['id'];
  }
}
