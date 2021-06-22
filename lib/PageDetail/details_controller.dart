import 'dart:async';

import 'package:appmovie/PageDetail/details_model.dart';
import 'package:appmovie/Storage/internal_storage_adapter.dart';
import 'package:appmovie/Storage/secure_storage.dart';
import 'package:appmovie/movie.dart';
import 'package:flutter/material.dart';

class MovieDetailViewModel {
  MovieDetailModel _model = MovieDetailModel();

  Future<MovieDetail> get movieDetail => _model.movieDetail;

  StreamController<MovieDetail> streamMovies = StreamController();

  final InternalStorageAdapter secureStorage = SecureStorage();

  String? isFav;
  IconData? favorite = Icons.favorite_border;

  toggleFavorite(int id) {
    favorite = isFav != null ? Icons.favorite : Icons.favorite_border;

    if (favorite == Icons.favorite_border) {
      saveFav(id);
      return favorite = Icons.favorite;
    } else {
      delFav(id);
      return favorite = Icons.favorite_border;
    }
  }

  void getMovieDetail(int id) {
    _model.getMovieDetail(id);
    _model.movieDetail.then((value) async {
      isFav = await getFav(value.id);
      value.isFavorite = isFav != null;
      streamMovies.add(value);
    });
  }

  saveFav(int id) {
    secureStorage.saveFav(id);
  }

  Future<String?> getFav(int id) async {
    return await secureStorage.getFav(id);
  }

  delFav(id) async {
    secureStorage.delFav(id);
  }
}
