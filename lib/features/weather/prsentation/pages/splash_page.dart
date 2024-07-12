import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/utils/internet_checker.dart';
import 'home_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    checkNetwork();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Center(
        child: Text(
          'Quick Weather App',
          style: TextStyle(
            fontSize: 24.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  checkNetwork() {
    isInternetAvailable().then((internet) {
      if (internet) {
        Timer(const Duration(seconds: 2), () {
          Get.off(() =>  HomePage());
        });
      }else{
        Get.snackbar('No network!', 'Please ensure your network connection.');
      }
    });
  }
}
