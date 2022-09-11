import 'dart:async';
import 'package:get/get.dart';

import '../Screens/AuthScreens/login.dart';

class SplashScreenController extends GetxController{
  @override
  void onInit() {
    timeFunc();
    super.onInit();
  }
  void timeFunc(){
    Timer(
        Duration(seconds: 3),
            () => Get.to(()=> Login()));

  }
}