import 'package:crafty_bay/local_cache.dart';
import 'package:crafty_bay/models/delete_modal.dart';
import 'package:crafty_bay/models/network_response.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:get/get.dart';

import '../user_interface/utils/urls.dart';

class DeleteCartController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  DeleteModal? _deleteCart;

  Future<bool> delete(String productId) async {
    _isLoading = true;
    update();

    String? token = await LocalCache.fetchToken();
    if (token != null) {
      NetworkResponse getServerResponse = await NetworkCaller.getResponse(
          url: Urls.deleteCart(productId: productId), token: token);
      _isLoading = false;

      if (getServerResponse.isSuccess) {
        _deleteCart = DeleteModal.fromJson(getServerResponse.responseBody);
        if (_deleteCart!.msg == "success") {
          update();
          return true;
        } else {
          update();
          return false;
        }
      } else {
        update();
        return false;
      }
    } else {
      update();
      return false;
    }
  }
}
