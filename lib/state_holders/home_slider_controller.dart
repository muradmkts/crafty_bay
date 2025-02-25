import 'package:crafty_bay/models/home_slider.dart';
import 'package:crafty_bay/models/network_response.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/user_interface/utils/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  HomeSlider? _serverData;

  HomeSlider? get serverData => _serverData;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _error;

  String? get error => _error;

  Future<bool> getHomeSlider() async {
    _isLoading = true;
    update();

    NetworkResponse serverResponse =
        await NetworkCaller.getResponse(url: Urls.sliders, token: "");

    _isLoading = false;
    if (serverResponse.isSuccess) {
      _serverData = HomeSlider.fromJson(serverResponse.responseBody);
      update();
      return true;
    } else {
      _error = serverResponse.errorMessage;
      update();
      return false;
    }
  }
}
