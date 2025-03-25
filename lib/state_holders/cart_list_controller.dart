import 'package:crafty_bay/local_cache.dart';
import 'package:crafty_bay/models/cart_list_model.dart';
import 'package:crafty_bay/models/network_response.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/user_interface/utils/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  CartListModel? _cartListData;

  CartListModel? get cartListData => _cartListData;

  Future<bool> getCartList() async {
    _isLoading = true;
    update();

    String? token = await LocalCache.fetchToken();
    if (token != null) {
      NetworkResponse serverResponseData =
          await NetworkCaller.getResponse(url: Urls.cartList, token: token);
      _isLoading = false;

      if (serverResponseData.isSuccess) {
        _cartListData = CartListModel.fromJson(serverResponseData.responseBody);
        update();
        return true;
      } else {
        update();
        return false;
      }
    } else {
      _isLoading = false;
      update();
      return false;
    }
  }
}
