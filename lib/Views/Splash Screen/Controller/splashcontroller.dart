import 'dart:async';

import 'package:final_exam/Views/HomeScreen/Screen/homepage.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getToNextScreen();
  }

  getToNextScreen() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const HomeScreen());
    });
  }
}
