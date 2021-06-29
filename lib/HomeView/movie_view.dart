import 'package:appmovie/HomeView/list_topRated.dart';
import 'package:appmovie/HomeView/list_upComing.dart';
import 'package:flutter/material.dart';

class MovieView extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height / 7,
          leading: Container(),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.vertical(
                  bottom: new Radius.elliptical(
                      MediaQuery.of(context).size.width, 56))),
          shadowColor: Colors.orange,
          backgroundColor: Colors.deepOrange,
          title: Center(child: Text('APP MOVIE')),
          bottom:
              TabBar(indicatorColor: Colors.deepPurple.withOpacity(.01), tabs: [
            Tab(
              text: 'FILMES',
              icon: Icon(Icons.movie),
            ),
            Tab(
              text: 'SERIES',
              icon: Icon(Icons.tv),
            ),
            Tab(text: 'Favoritos'),
          ]),
        ),
        body: TabBarView(
          children: [
            ListUpComing(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
