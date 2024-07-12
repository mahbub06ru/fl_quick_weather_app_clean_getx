import 'package:fl_quick_weather/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/weather_controller.dart';


class HomePage extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController(
    getWeather: Get.find(),
  ));

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(10.0.w),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: weatherController.cityNameController.value,
                  onSubmitted: (_) {
                    weatherController.fetchWeather(weatherController.cityNameController.value.text);
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter city name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        weatherController.fetchWeather(weatherController.cityNameController.value.text);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      if (weatherController.isLoading.value) {
                        return const CircularProgressIndicator();
                      } else if (weatherController.errorMessage.isNotEmpty) {
                        return Text(
                          weatherController.errorMessage.value,
                          style: const TextStyle(color: Colors.red),
                        );
                      } else if (weatherController.weather.value != null) {
                        final weather = weatherController.weather.value!;
                        return Column(
                          children: [
                            Text(
                              weather.cityName,
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${weather.temperature}°C',
                              style: const TextStyle(fontSize: 24),
                            ),
                            Text(
                              weather.description ?? '',
                              style: const TextStyle(fontSize: 24),
                            ),
                            Image.network(
                              'http://openweathermap.org/img/wn/${weather.icon}@2x.png',
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}