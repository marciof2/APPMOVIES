import 'package:appmovie/API/api.dart';
import 'package:appmovie/movie.dart';

class MovieDetailModel {
  final api = MovieAPI();

  late Future<MovieDetail> _movieDetail;

  Future<MovieDetail> get movieDetail => _movieDetail;

  getMovieDetail(int id) {
    return _movieDetail = api.getMovieDetail(id);
  }
}
