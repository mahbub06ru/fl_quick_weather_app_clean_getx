import 'package:dartz/dartz.dart';

import '../entity/weather_entity.dart';
import '../repository/weather_repository.dart';


class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  Future<Either<Exception, WeatherEntity>> call(String cityName) {
    return repository.getWeather(cityName);
  }
}
