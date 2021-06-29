import 'package:appmovie/HomeView/movie_controller.dart';
import 'package:appmovie/movie.dart';
import 'package:flutter/material.dart';

class ListPopular extends StatefulWidget {
  const ListPopular({Key? key}) : super(key: key);

  @override
  _ListPopularState createState() => _ListPopularState();
}

class _ListPopularState extends State<ListPopular> {
  var controller = MovieController();
  @override
  void initState() {
    super.initState();
    controller.loadPopular();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.35,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Popular',
                style: TextStyle(fontSize: 20),
              ),
            ),
            StreamBuilder<List<Popular>>(
                stream: controller.streamPopular.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return Container(
                      width: width,
                      height: height * 0.3,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var item = snapshot.data![index];
                            if (index == snapshot.data!.length - 5) {
                              controller.newPopularPage();
                            }
                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: width * 0.5,
                                  height: height * 0.05,
                                  child: Center(
                                    child: Text(
                                      '${snapshot.data![index].title}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'overview',
                                        arguments: item.id);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    width: width * 0.5,
                                    height: height * 0.2,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            color: Colors.grey,
                                            spreadRadius: 2,
                                            offset: Offset.fromDirection(2, 2))
                                      ],
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(item.urlImage !=
                                                null
                                            ? 'https://image.tmdb.org/t/p/w300' +
                                                item.urlImage!
                                            : ' '),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    );
                  }
                  return Container();
                })
          ],
        ),
      ),
    );
  }
}
