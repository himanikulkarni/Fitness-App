import 'dart:async';

import 'package:fitness_app/res/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashServices {
  void isLogin() {
    Timer(const Duration(seconds: 5), () => Get.toNamed(RouteName.loginView));
  }
}
