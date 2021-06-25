import 'package:appmovie/PageDetail/details_controller.dart';
import 'package:appmovie/movie.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  final viewModel = MovieDetailViewModel();
  late IconData iconFav;
  @override
  Widget build(BuildContext context) {
    int? id = ModalRoute.of(context)?.settings.arguments as int;

    viewModel.getMovieDetail(id);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[600],
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          title: Center(child: Text('DETALHES')),
        ),
        body: StreamBuilder<MovieDetail>(
            stream: viewModel.streamMovies.stream,
            builder: (context, snapshot) {
              var movie = snapshot.data;
              if (snapshot.connectionState != ConnectionState.active) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          //FOTO FILME
                          Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(movie!.urlImage != null
                                        ? 'https://image.tmdb.org/t/p/w300' +
                                            '${movie.urlImage}'
                                        : ' '),
                                    fit: BoxFit.cover)),
                          ),
                          //CONTAINER/LINHA - RATE/DATA/BOTAO FAV
                          Container(
                            color: Colors.red[300],
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  //RATING
                                  Container(
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
                                                '${movie.rating}',
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

                                  //DATA
                                  Container(
                                    child: Text(
                                      '${movie.data}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),

                                  //FAVORITE
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          viewModel.toggleFavorite(id);
                                        });
                                      },
                                      icon: Icon(movie.isFavorite != false
                                          ? Icons.favorite
                                          : Icons.favorite_border)),
                                ]),
                          ),
                          //TEXTO SINOPSE
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text('${movie.resumo}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
                //CONTAINER RETORNANDO ERRO
              } else {
                return Container(
                  child: Text('ERRO'),
                );
              }
            }),
      ),
    );
  }
}
