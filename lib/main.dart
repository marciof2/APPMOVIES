import 'package:appmovie/HomeView/movie_view.dart';
import 'package:appmovie/PageDetail/details_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MovieView(),
    routes: {'overview': (context) => Overview()},
  ));
}
