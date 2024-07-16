import 'package:fl_quick_weather/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/weather_controller.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherController weatherController = Get.put(WeatherController(
    getWeather: Get.find(),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quick Weather App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0.w),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: weatherController.cityNameController.value,
                  onSubmitted: (_) {
                    if (weatherController.cityNameController.value.text.trim().isNotEmpty) {
                      weatherController.addCity(weatherController.cityNameController.value.text.trim());
                      weatherController.fetchWeather(weatherController.cityNameController.value.text);
                    } else {
                      Get.snackbar('Oops!', 'Please enter a city first.');
                    }
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter city name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0.r),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        if (weatherController.cityNameController.value.text.trim().isNotEmpty) {
                          weatherController.addCity(weatherController.cityNameController.value.text.trim());
                          weatherController.fetchWeather(weatherController.cityNameController.value.text);
                        } else {
                          Get.snackbar('Oops!', 'Please enter a city first.');
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Obx(() {
              if (weatherController.isLoading.value) {
                return const CircularProgressIndicator();
              } else if (weatherController.errorMessage.isNotEmpty) {
                return Text(
                  weatherController.errorMessage.value,
                  style: const TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.normal),
                );
              } else if (weatherController.weather.value != null) {
                final weather = weatherController.weather.value!;
                return Column(
                  children: [
                    Text(
                      weather.cityName,
                      style:  TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${weather.temperature}°C',
                      style:  TextStyle(fontSize: 24.sp),
                    ),
                    Text(
                      weather.description ?? '',
                      style:  TextStyle(fontSize: 24.sp),
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
             SizedBox(height: 20.h),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: weatherController.cityNames.length,
                  itemBuilder: (context, index) {
                    final cityName = weatherController.cityNames[index];
                    return ListTile(
                      title: Text(cityName),
                      trailing: Obx(() => IconButton(
                        icon: Icon(
                          weatherController.isFavorite(cityName) ? Icons.star : Icons.star_border,
                          color: weatherController.isFavorite(cityName) ? Colors.yellow : null,
                        ),
                        onPressed: () {
                          weatherController.toggleFavorite(cityName);
                        },
                      )),
                      onTap: () {
                        weatherController.cityNameController.value.text = cityName;
                        weatherController.fetchWeather(cityName);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
