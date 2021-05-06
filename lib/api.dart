import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie.dart';

class MovieAPI {
  Map<String, String> queryParameters;
  Future<Movie> fetchMovie() async {
    final response = await http.get(
      Uri.https(
        'api.themoviedb.org',
        '/3/movie/upcoming',
        queryParameters = {'api_key': 'a5bc05fb630c9b7fdc560033345fa13e'},
      ),
    );

    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Tente Novamente');
    }
  }
}
