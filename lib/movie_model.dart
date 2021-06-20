import 'package:appmovie/api.dart';
import 'package:appmovie/internal_storage.dart';
import 'package:appmovie/internal_storage_adapter.dart';
import 'package:appmovie/movie.dart';

class MovieModel {
  List<UpComingMovies> _movies = [];
  var api = MovieAPI();
  int? id;
  String? title;
  String? fav;
  final InternalStorageAdapter internalStorage = InternalStorage();
  List<UpComingMovies> get movies => _movies;

  fetchMovie(int page) async {
    var up = await MovieAPI().fetchMovie(page);
    _movies.addAll(up.upcomingMovies!);
  }

  saveFav(id) {
    internalStorage.saveFav(id!, title!);
  }

  Future<String?> getFav(int id) async {
    return internalStorage.getFav(id);
  }
}
