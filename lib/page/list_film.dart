import 'package:flutter/material.dart';
import 'package:ini_film_app/service/http_service.dart';

class FilmList extends StatefulWidget {
  const FilmList({super.key});

  @override
  State<FilmList> createState() => _FilmListState();
}

class _FilmListState extends State<FilmList> {
  int? moviesCount = 0;
  List? film;
  HttpService? service;

  String result = "";

  Future initialize() async{
    film = [];
    film = (await service?.getPopularMovies());
    setState(() {
      moviesCount = film?.length;
      film = film;
    });
  }
  
  @override
  void initState(){
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    service!.getPopularMovies().then((value) => {
      setState(() {
        result =(value != null) as String;
      })
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular"),
      ),
      body: film!.isEmpty ? Container() : 
      ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, int position){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: Image(image: NetworkImage(film![position].posterPath)),
              title: Text(film![position].title),
              subtitle: Text("Rating : ${film![position].voteAverage.toString()}"),
            ),
          );
        }
      ),
    );
  }
}