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
        centerTitle: true,
        title: const Text(Constants.appName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.all(10.0.w),
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: weatherController.cityNameController.value,
                    onSubmitted: (_) {
                      if(weatherController.cityNameController.value.text.trim().isNotEmpty){
                        weatherController.fetchWeather(weatherController.cityNameController.value.text);
                      }else{
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
                          if(weatherController.cityNameController.value.text.trim().isNotEmpty){
                            weatherController.fetchWeather(weatherController.cityNameController.value.text);
                          }else{
                            Get.snackbar('Oops!', 'Please enter a city first.');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h,),
              Column(
                children: [
                  Obx(() {
                    if (weatherController.isLoading.value) {
                      return const CircularProgressIndicator();
                    } else if (weatherController.errorMessage.isNotEmpty) {
                      return Text(
                        weatherController.errorMessage.value,
                        style:  TextStyle(color: Colors.red,fontSize: 24.sp, fontWeight: FontWeight.normal),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}