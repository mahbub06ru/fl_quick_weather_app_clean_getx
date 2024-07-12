class Failure {
  final String message;
  Failure(this.message);
}

class WeatherException implements Exception {
  final String message;

  WeatherException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends WeatherException {
  NetworkException(super.message);
}

class InvalidCityNameException extends WeatherException {
  InvalidCityNameException(super.message);
}

class NoWeatherDataException extends WeatherException {
  NoWeatherDataException(super.message);
}