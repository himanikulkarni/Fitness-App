import 'package:fitness_app/res/routes/routes_name.dart';
import 'package:fitness_app/view/home/home_screen.dart';
import 'package:fitness_app/view/login/login_view.dart';
import 'package:fitness_app/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.loginView,
            page: () => const LoginView(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.homeScreen,
            page: () => const HomeScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade)
      ];
}
