import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/view_models/controller/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: true,
      obscuringCharacter: '*',
      validator: (value) {
        if (value!.isEmpty) {
          Utils.SnackBar('Password', 'Enter password');
        }
        return null;
      },
      onFieldSubmitted: (value) {},
      decoration: const InputDecoration(
          hintText: 'Enter password', border: OutlineInputBorder()),
    );
  }
}
