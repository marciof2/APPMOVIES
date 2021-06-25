class Lancamentos {
  List<UpComingMovies>? upcomingMovies;

  Lancamentos.fromJson(Map<String, dynamic> json) {
    var arrayMovie = json['results'] as List;

    upcomingMovies = arrayMovie.map((item) {
      return UpComingMovies.fromJson(item);
    }).toList();
  }
}

class MovieDetail {
  String? complet = 'https://image.tmdb.org/t/p/w300';
  String? title;
  String? urlImage;
  String? data;
  String? resumo;
  var id;
  var rating;
  bool? isFavorite = false;

  MovieDetail.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    urlImage = json['poster_path'];
    data = json['release_date'];
    rating = json['vote_average'];
    resumo = json['overview'];
    id = json['id'];
  }
}

class UpComingMovies {
  String? complet = 'https://image.tmdb.org/t/p/w300';
  String? title;
  String? urlImage;
  String? data;
  String? resumo;
  var id;
  var rating;

  UpComingMovies.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    urlImage = json['poster_path'];
    data = json['release_date'];
    rating = json['vote_average'];
    resumo = json['overview'];
    id = json['id'];
  }
}

class TopRatedMovies {
  List<TopRated>? topRatedList;

  TopRatedMovies.fromJson(Map<String, dynamic> json) {
    var arrayMovie = json['results'] as List;

    topRatedList = arrayMovie.map((item) {
      return TopRated.fromJson(item);
    }).toList();
  }
}

class TopRated {
  String? complet = 'https://image.tmdb.org/t/p/w300';
  String? title;
  String? urlImage;
  String? data;
  String? resumo;
  var id;
  var rating;

  TopRated.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    urlImage = json['poster_path'];
    data = json['release_date'];
    rating = json['vote_average'];
    resumo = json['overview'];
    id = json['id'];
  }
}
