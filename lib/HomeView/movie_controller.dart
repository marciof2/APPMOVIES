import 'dart:async';
import 'package:appmovie/HomeView/movie_model.dart';
import 'package:appmovie/movie.dart';

class MovieController {
  final model = MovieModel();
  int page = 1;
  var isFavorite;
  StreamController<List<UpComingMovies>> streamLista = StreamController();
  loadMovie() async {
    await model.fetchMovie(page);

    streamLista.add(model.movies);
  }

  newPage() {
    page++;
    loadMovie();
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
