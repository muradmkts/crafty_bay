import 'package:crafty_bay/models/category_data.dart';
import 'package:crafty_bay/models/network_response.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/user_interface/utils/urls.dart';
import 'package:get/get.dart';

class CategoryDataController extends GetxController {
  CategoryData? _serverData;

  CategoryData? get serverData => _serverData;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _error;

  String? get error => _error;

  Future<bool> getCategoryList() async {
    _isLoading = true;
    update();
    NetworkResponse serverResponse =
        await NetworkCaller.getResponse(url: Urls.categoryList, token: "");

    _isLoading = false;


    if (serverResponse.isSuccess) {
      _serverData = CategoryData.fromJson(serverResponse.responseBody);
      update();
      return true;
    } else {
      _error = serverResponse.errorMessage;
      update();
      return false;
    }
  }
}
