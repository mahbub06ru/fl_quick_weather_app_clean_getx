import 'package:dartz/dartz.dart';

import '../entity/weather_entity.dart';


abstract class WeatherRepository {
  Future<Either<Exception, WeatherEntity>> getWeather(String cityName);
}
