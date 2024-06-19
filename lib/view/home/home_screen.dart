import 'package:fitness_app/data/response/status.dart';
import 'package:fitness_app/res/components/general_exception.dart';
import 'package:fitness_app/res/components/internet_exception_widget.dart';
import 'package:fitness_app/res/routes/routes_name.dart';
import 'package:fitness_app/view_models/controller/home/home_view_models.dart';
import 'package:fitness_app/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginView);
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            if (homeController.error.value == 'No internet') {
              return InternetExceptionWidget(onPress: () {
                homeController.userListApi();
              });
            } else {
              return GeneralExceptionWidget(onPress: () {
                homeController.userListApi();
              });
            }
            return Text(homeController.error.toString());
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(homeController
                          .userList.value.data![index].avatar
                          .toString()),
                    ),
                    title: Text(homeController
                        .userList.value.data![index].firstName
                        .toString()),
                    subtitle: Text(homeController
                        .userList.value.data![index].email
                        .toString()),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
