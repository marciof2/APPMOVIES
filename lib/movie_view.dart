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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Movie'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Movie>(
            future: controller.movie,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.movies.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(50),
                          width: 250,
                          height: 250,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data.movies[index].title,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                snapshot.data.movies[index].data,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 35),
                              ),
                            ],
                          ));
                    },
                  ),
                );
              } else {
                return Text('${snapshot.error}');
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                print(controller.loadMovie());
              });
            },
            child: Text('Load Movie'),
          ),
        ],
      ),
    );
  }
}
