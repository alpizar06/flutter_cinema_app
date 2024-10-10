import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';


class MoviesProvider extends ChangeNotifier{

  String _apiKey   = '04dba33b983e68c500b9172f5c82537c';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  MoviesProvider(){
    print('Movies Provider inicializado');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String>_getJsonData(String endpoint,[int page = 1]) async {
var url = Uri.https(this._baseUrl,endpoint,{
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }


  getOnDisplayMovies() async{
    final jsonData = await _getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromRawJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();

  }

  getPopularMovies() async {

    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular',_popularPage);

    final popularResponse = PopularResponse.fromRawJson(jsonData);

    popularMovies = [...popularMovies , ...popularResponse.results];
    notifyListeners();
  }
}