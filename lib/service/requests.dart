//dart io
import 'dart:io';
//dio
import 'package:dio/dio.dart';
//flutter
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//model
import 'package:weather_app_with_api/model/weather_model.dart';

class weatherService {
  final Dio _networkManager = Dio(
      BaseOptions(baseUrl: "https://api.collectapi.com/weather/getWeather",
      headers: {
        'Authorization': 'apikey 6rYPXckByktiAQIRzf4yU4:6FqqKxoJ8LyhElugNxlKXs',
        'Content-Type': 'application/json',
      }
      ));

  
    

  Future<weatherModel?> getRequestWeather(String language, String city,BuildContext context) async {
    try {
      final response = await _networkManager.get("",
       queryParameters: {
        "data.lang": language,
        "data.city":city ,
      });

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is Map<String, dynamic>) {
           return  weatherModel.fromJson(_datas);
        }
      }
    } on DioError catch (e) {
       showDebug.showDioError(e, this);
    }
  }
}

class showDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
    }
  }
}

