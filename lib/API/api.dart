import 'dart:convert';
import 'package:http/http.dart' as http;
import '../movie.dart';

class MovieAPI {
  Future<Lancamentos> getUpcomingMovies(int page) async {
    final response = await http.get(
      Uri.https('api.themoviedb.org', '/3/movie/upcoming', {
        'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
        'page': '$page',
        'language': 'pt-BR'
      }),
    );

    if (response.statusCode == 200) {
      return Lancamentos.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Tente Novamente');
    }
  }

  Future<TopRatedMovies> getTopRated(int page) async {
    final response = await http.get(
      Uri.https('api.themoviedb.org', '/3/movie/top_rated', {
        'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
        'page': '$page',
        'language': 'pt-BR'
      }),
    );

    if (response.statusCode == 200) {
      return TopRatedMovies.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Tente Novamente');
    }
  }

  Future<MovieDetail> getMovieDetail(int id) async {
    final response = await http.get(Uri.https(
      'api.themoviedb.org',
      '/3/movie/$id',
      {'api_key': 'a5bc05fb630c9b7fdc560033345fa13e', 'language': 'pt-BR'},
    ));

    if (response.statusCode == 200) {
      return MovieDetail.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Movie not Found');
    }
  }

  Future<PopularMovies> getPopular(int page) async {
    final response = await http.get(
      Uri.https('api.themoviedb.org', '/3/movie/popular', {
        'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
        'page': '$page',
        'language': 'pt-BR'
      }),
    );

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Tente Novamente');
    }
  }
}
