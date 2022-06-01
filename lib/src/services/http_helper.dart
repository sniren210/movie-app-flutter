import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../models/movie.dart';

class HttpHelper {
  final String urlKey = 'api_key=131b3862ad9e0be3f42c88ab23458b74';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlSearch =
      'https://api.themoviedb.org/3/search/movie?api_key=131b3862ad9e0be3f42c88ab23458b74&query=';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';

  Future<List> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;

    http.Response result = await http.get(Uri.parse(upcoming));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return [];
    }
  }

  Future<List> findMovies(String title) async {
    final String query = urlSearch + title;

    http.Response result = await http.get(Uri.parse(query));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return [];
    }
  }
}
