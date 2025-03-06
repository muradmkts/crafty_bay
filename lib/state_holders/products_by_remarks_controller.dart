import 'package:crafty_bay/models/network_response.dart';
import 'package:crafty_bay/models/products_by_remarks.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:get/get.dart';

import '../user_interface/utils/urls.dart';



class ProductsByRemarksController extends GetxController{

  bool _isloading = false;
  bool get isLoading => _isloading;

  ProductsByRemarks? _popularProducts;
  ProductsByRemarks? get popularProducts => _popularProducts;

  ProductsByRemarks? _specialProducts;
  ProductsByRemarks? get specialProducts => _specialProducts;

  ProductsByRemarks? _newProducts;
  ProductsByRemarks? get newProducts => _newProducts;

  String? _error;
  String? get error => _error;



  Future<bool> getServerData(String remark) async {
    _isloading = true;
    update();

    NetworkResponse networkData = await NetworkCaller.getResponse(url: Urls.listByRemark(remark: remark), token: "");

    _isloading = false;
    if(networkData.isSuccess){
      if(remark == "popular") _popularProducts = ProductsByRemarks.fromJson(networkData.responseBody);
      if(remark == "special") _specialProducts = ProductsByRemarks.fromJson(networkData.responseBody);
      if(remark == "new") _newProducts = ProductsByRemarks.fromJson(networkData.responseBody);
      update();
      return true;

    }else{
      _error = networkData.errorMessage;
      update();
      return false;

    }


  }



}