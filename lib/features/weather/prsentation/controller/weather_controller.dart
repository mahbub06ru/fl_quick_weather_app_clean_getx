
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../app/errors/failure.dart';
import '../../domain/entity/weather_entity.dart';
import '../../domain/usecase/weather_usecase.dart';

class WeatherController extends GetxController {
  final GetWeather getWeather;

  WeatherController({required this.getWeather});

  var weather = Rxn<WeatherEntity>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var cityNameController = TextEditingController().obs;

  Future<void> fetchWeather(String cityName) async {
    isLoading.value = true;
    try {
      final result = await getWeather(cityName);
      result.fold(
            (failure) {
          errorMessage.value = _mapFailureToMessage(failure);
          weather.value = null;
        },
            (weatherEntity) {
          weather.value = weatherEntity;
          errorMessage.value = '';
        },
      );
    } on InvalidCityNameException catch (e) {
      errorMessage.value = e.toString();
      weather.value = null;
    } on NetworkException catch (e) {
      errorMessage.value = 'Network error. Please check your connection.';
    } on NoWeatherDataException catch (e) {
      errorMessage.value = 'No weather data found for the provided city.';
    } on WeatherException catch (e) {
      // errorMessage.value = 'An unexpected error occurred';
      errorMessage.value = 'Invalid city name. Please enter a valid city name.';
    } catch (e) {
      // errorMessage.value = 'An unexpected error occurred';
      errorMessage.value = 'Invalid city name. Please enter a valid city name.';
    } finally {
      isLoading.value = false;
    }
  }

  String _mapFailureToMessage(failure) {
    return failure.toString();
  }


}