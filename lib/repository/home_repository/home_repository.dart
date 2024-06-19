import 'package:fitness_app/data/network/network_api_services.dart';
import 'package:fitness_app/models/home/user_list_model.dart';
import 'package:fitness_app/models/login/user_model.dart';
import 'package:fitness_app/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}
