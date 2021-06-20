import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie.dart';

class MovieAPI {
  Future<Lancamentos> fetchMovie(int page) async {
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
}
