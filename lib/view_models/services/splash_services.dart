import 'dart:async';

import 'package:fitness_app/res/routes/routes_name.dart';
import 'package:fitness_app/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:get/get.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();
  void isLogin() {
    userPreference.getUser().then((value) {
      print(value.token);
      print(value.isLogin);
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(
            const Duration(seconds: 5), () => Get.toNamed(RouteName.loginView));
      } else {
        Timer(const Duration(seconds: 5),
            () => Get.toNamed(RouteName.homeScreen));
      }
    });
  }
}
