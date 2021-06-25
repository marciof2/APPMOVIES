import 'package:appmovie/Storage/internal_storage_adapter.dart';
import 'package:appmovie/Storage/secure_storage.dart';
import 'package:appmovie/API/api.dart';

import 'package:appmovie/movie.dart';

class MovieModel {
  List<UpComingMovies> _movies = [];
  List<TopRated> _topRated = [];

  var api = MovieAPI();

  final InternalStorageAdapter internalStorage = SecureStorage();
  List<UpComingMovies> get movies => _movies;
  List<TopRated> get topMovies => _topRated;

  getTopRated(page) async {
    var top = await MovieAPI().getTopRated(page);
    _topRated.addAll(top.topRatedList!);
  }

  fetchMovie(int page) async {
    var up = await MovieAPI().fetchMovie(page);
    _movies.addAll(up.upcomingMovies!);
  }

  void saveFav(id) {
    internalStorage.saveFav(id);
  }

  void delFav(int id) async {
    internalStorage.delFav(id);
  }

  getFav(id) {
    internalStorage.getFav(id);
  }
}
