import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MoviesProvider extends ChangeNotifier{

  String _apiKey   = '04dba33b983e68c500b9172f5c82537c';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';

  MoviesProvider(){
    print('Movies Provider inicializado');
    this.getOnDisplayMovies();
  }


  getOnDisplayMovies() async{
    var url = Uri.https(this._baseUrl,'3/movie/now_playing',{
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });


    final response = await http.get(url);
    final Map<String,dynamic> decodeData = json.decode(response.body);

    print(decodeData);
  }
}