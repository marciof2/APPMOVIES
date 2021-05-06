import 'package:appmovie/movie_model.dart';
import 'package:appmovie/movie.dart';

class MovieController {
  final model = MovieModel();
  Future<Movie> get movie => model.movie;

  loadMovie() {
    model.fetchMovie();
  }
}
