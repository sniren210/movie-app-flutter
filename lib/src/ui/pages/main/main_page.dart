import 'package:flutter/material.dart';
import 'package:movies/movies.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieList();
  }
}
