import 'package:appmovie/Storage/internal_storage_adapter.dart';
import 'package:appmovie/Storage/secure_storage.dart';
import 'package:appmovie/api.dart';

import 'package:appmovie/movie.dart';

class MovieModel {
  List<UpComingMovies> _movies = [];
  var api = MovieAPI();

  final InternalStorageAdapter internalStorage = SecureStorage();
  List<UpComingMovies> get movies => _movies;

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
