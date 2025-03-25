import 'package:crafty_bay/models/network_response.dart';
import 'package:crafty_bay/models/product_details_data.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/user_interface/utils/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ProductDetailsData? _productDetailsData;

  ProductDetailsData? get productDetailsData => _productDetailsData;

  String? _error;

  String? get error => _error;

  Future<bool> getServerResponse(String productId) async {
    _isLoading = true;
    update();

    NetworkResponse serverResponse = await NetworkCaller.getResponse(
        url: Urls.details(productId: productId), token: "");
    _isLoading = false;
    if (serverResponse.isSuccess) {
      _productDetailsData =
          ProductDetailsData.fromJson(serverResponse.responseBody);
      update();
      return true;
    } else {
      _error = serverResponse.errorMessage;
      update();
      return false;
    }
  }
}
