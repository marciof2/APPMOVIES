import 'dart:async';
import 'package:appmovie/HomeView/movie_model.dart';
import 'package:appmovie/movie.dart';

class MovieController {
  MovieModel model = MovieModel();
  int page = 1;
  StreamController<List<TopRated>> streamTopRated = StreamController();
  StreamController<List<UpComingMovies>> streamLista = StreamController();

  loadUpComingMovie() async {
    await model.fetchMovie(page);
    streamLista.add(model.movies);
  }

  loadTopRated() async {
    await model.getTopRated(page);
    streamTopRated.add(model.topMovies);
  }

  newPageUpComingMovies() {
    page++;
    loadUpComingMovie();
  }

  saveFav(id) {
    model.saveFav(id);
  }

  delFav(id) {
    model.delFav(id);
  }

  Future<String?> getFav(id) {
    return model.getFav(id);
  }
}
