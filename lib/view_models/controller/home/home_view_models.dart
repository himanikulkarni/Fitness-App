import 'package:fitness_app/data/response/status.dart';
import 'package:fitness_app/models/home/user_list_model.dart';
import 'package:fitness_app/repository/home_repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(UserListModel value) => userList.value = value;
  void setError(String value) => error.value = value;

  void userListApi() {
    //setRxRequestStatus(Status.LOADING);

    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      print(error);
      print(stackTrace);
      setRxRequestStatus(Status.ERROR);
    });
  }
}
