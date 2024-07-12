import 'package:fl_quick_weather/app_binding/weather_binding.dart';
import 'package:get/get.dart';

import '../../../features/weather/prsentation/pages/splash_page.dart';
import '../../../features/weather/prsentation/pages/home_page.dart';

class AppPages {
  static final getKey = [
    GetPage(name: '/SplashPage', page: () => const SplashPage()),
    GetPage(name: '/HomePage', page: () =>   HomePage(),binding: WeatherBinding()),
  ];
}