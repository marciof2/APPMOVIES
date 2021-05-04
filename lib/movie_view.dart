import 'dart:ui';
import 'package:appmovie/controller.dart';
import 'package:appmovie/movie.dart';
import 'package:flutter/material.dart';

class MovieView extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MovieView> {
  var controller = MovieController();
  @override
  void initState() {
    super.initState();
    controller.loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(9),
            child: Text(
              'App Movie',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder<Movie>(
              future: controller.movie,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      width: 150,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.red[300],
                              Colors.red,
                              Colors.red[400],
                              Colors.red[600],
                              Colors.red[800],
                              Colors.red[900],
                            ]),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: ListView.builder(
                        itemCount: snapshot.data.movies.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //Capa do filme
                              Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.all(5),
                                child: Stack(children: [
                                  Center(
                                    child: Image.network(
                                      snapshot.data.movies[index].urlImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  //Posição do Título
                                  Positioned(
                                    bottom: -5.0,
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(),
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Text(
                                          snapshot.data.movies[index].title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Posição da Data
                                  Positioned(
                                    top: 05.0,
                                    right: 50.0,
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(9),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        snapshot.data.movies[index].data,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 50,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black),
                                      child: Center(
                                        child: Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.greenAccent),
                                          child: Center(
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black),
                                              child: Center(
                                                child: Text(
                                                  '${snapshot.data.movies[index].rating}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          );
                        }),
                  );
                } else {
                  return Center(
                    child: TextButton(
                      onPressed: () {
                        controller.loadMovie();
                      },
                      child: Text('Tentar Novamente'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
