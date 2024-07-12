import '../../../../app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/config/route/app_pages.dart';
import '../app_binding/main_binding.dart';
import 'weather/prsentation/pages/splash_page.dart';


class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return ScreenUtilInit(
        designSize:  const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            builder: EasyLoading.init(),
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            initialBinding: AppBinding(),
            theme: ThemeData(
              textTheme: GoogleFonts.urbanistTextTheme(),
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                  color: const Color(0xFF7E8BA0),
                  fontSize: 14.sp,
                  fontFamily: Constants.fontUrbanist,
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontFamily: Constants.fontUrbanist,
                  fontWeight: FontWeight.w700,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: const Color(0xFF525C67), width: 0.3.r), // Custom underline when enabled
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: const Color(0xFF525C67), width: 0.5.r), // Custom underline when focused
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: const Color(0xFF525C67), width: 0.3.r), // Custom underline when error
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: const Color(0xFF525C67), width: 0.3.r), // Custom underline when disabled
                ),
              ),
            ),
            getPages: AppPages.getKey,
            home: const SplashPage(),
          );
        }
    );

  }
}