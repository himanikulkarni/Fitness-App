import 'package:fitness_app/res/components/round_button.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/view_models/controller/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginVM.emailController.value,
                    focusNode: loginVM.emailFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.SnackBar('Email', 'Enter email');
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginVM.emailFocusNode.value,
                          loginVM.passwordFocusNode.value);
                    },
                    decoration: const InputDecoration(
                        hintText: 'Enter email', border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
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
                        hintText: 'Enter password',
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(
              () => RoundButton(
                loading: loginVM.loading.value,
                title: 'Login',
                width: 200,
                onPress: () {
                  if (_formkey.currentState!.validate()) {
                    loginVM.loginApi();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
