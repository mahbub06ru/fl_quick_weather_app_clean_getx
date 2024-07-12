import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../features/weather/data/datasource/weather_data_sources.dart';
import '../features/weather/data/repository/weather_repository_impl.dart';
import '../features/weather/domain/repository/weather_repository.dart';
import '../features/weather/domain/usecase/weather_usecase.dart';
import '../features/weather/prsentation/controller/weather_controller.dart';


class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<http.Client>(() => http.Client());
    Get.lazyPut<WeatherRemoteDataSource>(
            () => WeatherRemoteDataSourceImpl(client: Get.find<http.Client>()));
    Get.lazyPut<WeatherRepository>(
            () => WeatherRepositoryImpl(remoteDataSource: Get.find<WeatherRemoteDataSource>()));
    Get.lazyPut<GetWeather>(() => GetWeather(Get.find<WeatherRepository>()));
    Get.lazyPut<WeatherController>(() => WeatherController(getWeather: Get.find<GetWeather>()));
  }
}