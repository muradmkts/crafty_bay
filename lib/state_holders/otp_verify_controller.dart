import 'package:crafty_bay/local_cache.dart';
import 'package:crafty_bay/models/auth_data.dart';
import 'package:crafty_bay/user_interface/utils/urls.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/network_response.dart';
import '../services/network_caller.dart';

class OtpVerifyController extends GetxController {
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  AuthData? _serverData;

  bool _isProfileExist = false;

  bool get isProfileExist => _isProfileExist;

  Future<bool> sendOtp(String email, String otp) async {
    _isLoading = true;
    update();

    NetworkResponse serverResponse = await NetworkCaller.getResponse(
        url: Urls.verifyLogin(email: email, otp: otp), token: "");
    if (serverResponse.isSuccess &&
        serverResponse.responseBody["msg"].toString() == "success") {
      _serverData = AuthData.fromJson(serverResponse.responseBody);
      await LocalCache.saveToken(_serverData!.token!);
      String? token = await LocalCache.fetchToken();
      if (kDebugMode) {
        print("--------------------------$token---------------------------");
      }
      NetworkResponse userProfile =
          await NetworkCaller.getResponse(url: Urls.readProfile, token: token!);
      if (kDebugMode) {
        print(
            "--------------------------${userProfile.responseBody["data"]}---------------------------");
      }
      if (userProfile.responseBody["data"] != null) {
        _isProfileExist = true;
      }
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
