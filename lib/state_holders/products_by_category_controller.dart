import 'package:crafty_bay/models/network_response.dart';
import 'package:crafty_bay/models/products_by_remarks.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:get/get.dart';

import '../user_interface/utils/urls.dart';

class ProductsByCategoryController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ProductsByRemarks? _products;

  ProductsByRemarks? get products => _products;

  String? _error;

  String? get error => _error;

  Future<bool> getServerData(String categoryId) async {
    _isLoading = true;
    update();

    NetworkResponse networkData = await NetworkCaller.getResponse(
        url: Urls.listByCategory(categoryId: categoryId), token: "");

    _isLoading = false;
    if (networkData.isSuccess) {
      _products = ProductsByRemarks.fromJson(networkData.responseBody);
      update();
      return true;
    } else {
      _error = networkData.errorMessage;
      update();
      return false;
    }
  }
}
