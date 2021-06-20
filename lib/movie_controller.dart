import 'dart:async';
import 'package:appmovie/movie.dart';
import 'package:appmovie/movie_model.dart';

class MovieController {
  final model = MovieModel();
  int page = 1;

  late String? isFav;
  StreamController<List<UpComingMovies>> streamLista = StreamController();
  loadMovie() async {
    await model.fetchMovie(page);
    streamLista.add(model.movies);
  }

  newPage() {
    page++;
    loadMovie();
  }
}
