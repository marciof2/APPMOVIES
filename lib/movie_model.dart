import 'package:appmovie/api.dart';
import 'package:appmovie/movie.dart';

class MovieModel {
  Future<Movie> _movie;

  Future<Movie> get movie => _movie;

  fetchMovie() {
    _movie = MovieAPI().fetchMovie();
  }
}
