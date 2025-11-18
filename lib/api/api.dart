import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uts_movie/constants.dart';
import 'package:uts_movie/models/movies.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constans.apiKey}';
  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constans.apiKey}';
  static const _upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constans.apiKey}';

  Future<List<Movies>> getTrendingWidget() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Somthing happened');
    }
  }

  Future<List<Movies>> getTopRatedMovie() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Somthing happened');
    }
  }

  Future<List<Movies>> getUpComingWidget() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Somthing happened');
    }
  }

}
