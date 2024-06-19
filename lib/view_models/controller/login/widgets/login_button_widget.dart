import 'package:fitness_app/res/components/round_button.dart';
import 'package:fitness_app/view_models/controller/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  LoginButtonWidget({super.key, required this.formKey});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RoundButton(
        loading: loginVM.loading.value,
        title: 'Login',
        width: 200,
        onPress: () {
          if (formKey.currentState!.validate()) {
            loginVM.loginApi();
          }
        },
      ),
    );
  }
}
