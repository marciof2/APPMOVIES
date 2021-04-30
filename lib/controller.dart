import 'package:appmovie/model.dart';
import 'package:appmovie/movie.dart';

class MovieController {
  final model = MovieModel();
  Future<Movie> get movie => model.movie;

  loadMovie() {
    model.fetchMovie();
  }
}
