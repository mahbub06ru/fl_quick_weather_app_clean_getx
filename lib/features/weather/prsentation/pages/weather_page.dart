
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/utils/constants.dart';
import '../controller/weather_controller.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherController weatherController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300.0, // Adjust the width as needed
              child: TextField(
                controller: weatherController.cityNameController.value,
                onSubmitted: (_) {

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

                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'City name',
                style:  TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                '0 °C',
                style:  TextStyle(fontSize: 24.sp),
              ),
              Text(
                'Description',
                style: TextStyle(fontSize: 24.sp),
              ),
              Image.network(
                'http://openweathermap.org/img/wn/${''}@2x.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}