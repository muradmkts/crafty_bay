import 'package:crafty_bay/local_cache.dart';
import 'package:crafty_bay/models/network_response.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:get/get.dart';

import '../models/AddCartData.dart';
import '../user_interface/utils/urls.dart';

class AddCartController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> addCart({required AddCartData cartDetails}) async {
    _isLoading = true;
    update();
    final String? token = await LocalCache.fetchToken();
    if (token != null) {
      final NetworkResponse networkResponse = await NetworkCaller.postResponse(
          url: Urls.addCart, token: token, dataToPost: cartDetails.toJson());
      _isLoading = false;
      update();
      if (networkResponse.isSuccess) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
