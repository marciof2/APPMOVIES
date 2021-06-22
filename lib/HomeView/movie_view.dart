import 'dart:ui';
import 'package:appmovie/HomeView/movie_controller.dart';
import 'package:appmovie/Storage/secure_storage.dart';
import 'package:appmovie/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        backgroundColor: Color.fromRGBO(143, 49, 49, 56),
        title: Center(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(9),
            child: Text(
              'LANÇAMENTOS',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            StreamBuilder<List<UpComingMovies>>(
              stream: controller.streamLista.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.active) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(162, 103, 103, 63),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var count = snapshot.data![index];
                          if (index == snapshot.data!.length - 5) {
                            controller.newPage();
                            print('Chegamos no final da lista ');
                          }
                          return Column(
                            children: [
                              //TITULO
                              Title(count.title),

                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [],
                                ),
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Stack(children: [
                                  ContainerMovie(
                                      count.urlImage,
                                      count.rating,
                                      count.resumo,
                                      count.data,
                                      count.title,
                                      count.id),

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
                                        count.data!,
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
                                                  '${count.rating}',
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

class Title extends StatelessWidget {
  final title;

  Title(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 120,
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}

class ContainerMovie extends StatelessWidget {
  final image;
  final rating;
  final resumo;
  final data;
  final title;
  var id;
  ContainerMovie(
      this.image, this.rating, this.resumo, this.data, this.title, this.id);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Overview(image, rating, resumo, data, title, id)));
        },
        //CAPA
        child: Container(
          width: 250,
          height: 350,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset.fromDirection(-6, 3),
                color: Color.fromARGB(100, 22, 54, 39),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(image != null
                  ? 'https://image.tmdb.org/t/p/w300' + image
                  : ' '),
            ),
          ),
        ),
      ),
    );
  }
}

class Overview extends StatefulWidget {
  final title;
  final rating;
  final resumo;
  final data;
  final image;
  final id;
  Overview(
      this.image, this.rating, this.resumo, this.data, this.title, this.id);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    var controller = MovieController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[600],
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.image != null
                                ? 'https://image.tmdb.org/t/p/w300' +
                                    widget.image
                                : ' '),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    color: Colors.red[300],
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //RATING
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
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
                                        '${widget.rating}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800),
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
                              widget.data,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          //FAVORITE *Não funcional*
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  var isFavorite = SecureStorage().isFavorite;
                                  if (isFavorite == false) {
                                    SecureStorage().saveFav(widget.id);
                                    print('SALVANDO');
                                    isFavorite = true;
                                  } else {
                                    SecureStorage().delFav(widget.id);
                                    print('DELETANDO');
                                    print(isFavorite);
                                  }
                                });
                              },
                              icon: Icon(
                                SecureStorage().isFavorite == false
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                              )),
                        ]),
                  ),
                  Text(widget.resumo,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
