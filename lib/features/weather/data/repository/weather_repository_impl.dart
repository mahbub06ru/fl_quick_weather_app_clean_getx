import 'package:dartz/dartz.dart';

import '../../../../app/errors/failure.dart';
import '../../domain/entity/weather_entity.dart';
import '../../domain/repository/weather_repository.dart';
import '../datasource/weather_data_sources.dart';


class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WeatherException, WeatherEntity>> getWeather(String cityName) async {
    try {
      final weatherModel = await remoteDataSource.getWeather(cityName);
      if (weatherModel == null) {
        throw NoWeatherDataException('No weather data found for the provided city');
      }
      return Right(weatherModel.toEntity());
    } on InvalidCityNameException catch (e) {
      throw InvalidCityNameException('Invalid city name. Please enter a valid city name');
    } catch (e) {
      if (e is NoWeatherDataException || e is FormatException) {
        throw NoWeatherDataException('No weather data found for the provided city');
      } else if (e is NetworkException) {
        throw NetworkException('Network error. Please check your connection');
      } else {
        // throw WeatherException('An unexpected error occurred');
        throw WeatherException('Invalid city name. Please enter a valid city name');
      }
    }
  }
}
