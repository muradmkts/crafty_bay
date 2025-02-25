import 'dart:core';

import 'package:crafty_bay/models/network_response.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/state_holders/otp_timer_controller.dart';
import 'package:crafty_bay/user_interface/utils/urls.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> getLogin(String email) async {
    _isLoading = true;
    update();
    final NetworkResponse serverResponse = await NetworkCaller.getResponse(
        url: Urls.login(email: email), token: "");
    if (serverResponse.isSuccess) {
      _isLoading = false;
      update();
      if (kDebugMode) {
        print("--------------------------${serverResponse.responseBody}---------------------------");
      }
      Get.find<OTPTimerController>().startTimer();
      return true;
    } else {
      _isLoading = false;
      update();
      return false;
    }
  }
}
