import 'package:flutter/material.dart';
import 'package:ini_film_app/page/list_film.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FilmList();
  }
}