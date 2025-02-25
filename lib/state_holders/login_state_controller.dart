import 'package:crafty_bay/local_cache.dart';
import 'package:get/get.dart';

import '../models/network_response.dart';
import '../services/network_caller.dart';
import '../user_interface/utils/urls.dart';

class LoginStateController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> checkLoginState() async {
    _isLoading = true;
    update();
    String? token = await LocalCache.fetchToken();
    if (token == null) {
      _isLoading = false;
      update();
      return false;
    }
    NetworkResponse serverResponse =
        await NetworkCaller.getResponse(url: Urls.readProfile, token: token);
    if (serverResponse.isSuccess == false) {
      _isLoading = false;
      update();
      return false;
    } else if (serverResponse.responseBody["msg"].toString() == "success") {
      _isLoading = false;
      update();

      return true;
    } else {
      _isLoading = false;
      update();
      return false;
    }
  }
}
