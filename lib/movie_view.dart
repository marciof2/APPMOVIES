import 'dart:ui';
import 'package:appmovie/movie_controller.dart';
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
              'LANÇAMENTOS',
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
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.movies.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //TITULO
                              Container(
                                decoration: BoxDecoration(),
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    snapshot.data.movies[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                              //Capa do filme
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.6,
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: -10,
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.all(5),
                                child: Stack(children: [
                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Overview(
                                                  snapshot.data.movies[index]
                                                      .resumo),
                                            ),
                                          );
                                        });
                                      },
                                      child: Image.network(
                                        snapshot.data.movies[index].urlImage,
                                      ),
                                    ),
                                  ),
                                  //DATA
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
                                  //RATING
                                  Positioned(
                                    left: 10,
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

class Overview extends StatelessWidget {
  final String c;
  Overview(this.c);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Overview')),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  color: Colors.black.withOpacity(.3),
                  spreadRadius: 3,
                  offset: Offset(1, 3))
            ],
          ),
          width: 400,
          child: Text(
            c,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
