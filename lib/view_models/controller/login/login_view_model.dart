import 'package:fitness_app/models/login/user_model.dart';
import 'package:fitness_app/repository/login_repository/login_repository.dart';
import 'package:fitness_app/res/routes/routes_name.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.SnackBar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(token: value['token'], isLogin: true);

        userPreference.saveUser(userModel).then((value) {
          Get.toNamed(RouteName.homeScreen);
        }).onError((error, stackTrace) {});
        Utils.SnackBar('Login', 'Login successfully');
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      loading.value = false;

      Utils.SnackBar('Error', error.toString());
    });
  }
}
