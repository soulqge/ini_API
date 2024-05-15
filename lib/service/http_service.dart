import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ini_film_app/models/film.dart';

class HttpService {
  final String baseUrl = 'https://movie.tukanginyuk.com/api/getmovie';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl;

    http.Response result = await http.get(Uri.parse(uri));

    if(result.statusCode == HttpStatus.ok){
      print("Connected");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['data'];
      List movie = moviesMap.map((i) => Film.fromJson(i)).toList();
      return movie;
    }else{
      print("Not Connected");
      return null;
    }
    
  }
}
