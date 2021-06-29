import 'package:appmovie/Storage/internal_storage_adapter.dart';
import 'package:appmovie/Storage/secure_storage.dart';
import 'package:appmovie/API/api.dart';
import 'package:appmovie/movie.dart';

class MovieModel {
  var api = MovieAPI();
  List<UpComingMovies> _movies = [];
  List<TopRated> _topRated = [];
  List<Popular> _popularMovies = [];

  final InternalStorageAdapter internalStorage = SecureStorage();
  List<UpComingMovies> get movies => _movies;
  List<TopRated> get topMovies => _topRated;
  List<Popular> get popularMovies => _popularMovies;

  getPopularMovies(page) async {
    var top = await MovieAPI().getPopular(page);
    _popularMovies.addAll(top.popularMoviesList!);
  }

  getTopRated(page) async {
    var top = await MovieAPI().getTopRated(page);
    _topRated.addAll(top.topRatedList!);
  }

  getUpcomingMovies(int page) async {
    var up = await MovieAPI().getUpcomingMovies(page);
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
