import 'dart:async';
import 'package:appmovie/HomeView/movie_model.dart';
import 'package:appmovie/movie.dart';

class MovieController {
  MovieModel model = MovieModel();
  int page = 1;
  StreamController<List<TopRated>> streamTopRated = StreamController();
  StreamController<List<UpComingMovies>> streamLista = StreamController();
  StreamController<List<Popular>> streamPopular = StreamController();

  loadUpComingMovie() async {
    await model.getUpcomingMovies(page);
    streamLista.add(model.movies);
  }

  loadPopular() async {
    await model.getPopularMovies(page);
    streamPopular.add(model.popularMovies);
  }

  loadTopRated() async {
    await model.getTopRated(page);
    streamTopRated.add(model.topMovies);
  }

  newPopularPage() {
    page++;
    loadPopular();
  }

  newPageUpComingMovies() {
    page++;
    loadUpComingMovie();
  }

  newPageTopRated() {
    page++;
    loadTopRated();
  }
}
