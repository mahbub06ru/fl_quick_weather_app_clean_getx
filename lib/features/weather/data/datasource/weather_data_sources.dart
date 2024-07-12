import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/weather_model.dart';


abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;
  final String apiKey = 'dbd3b02d8958d62185d02e944cd5f522';

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getWeather(String cityName) async {
    final response = await client.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
