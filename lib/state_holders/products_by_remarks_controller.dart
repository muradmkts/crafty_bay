import 'package:crafty_bay/models/network_response.dart';
import 'package:crafty_bay/models/products_by_remarks.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:get/get.dart';

import '../user_interface/utils/urls.dart';



class ProductsByRemarksController extends GetxController{

  bool _isloading = false;
  bool get isLoading => _isloading;

  ProductsByRemarks? _serverData;
  ProductsByRemarks? get serverData => _serverData;

  String? _error;
  String? get error => _error;



  Future<bool> getServerData(String remark) async {
    _isloading = true;
    update();

    NetworkResponse networkData = await NetworkCaller.getResponse(url: Urls.listByRemark(remark: remark), token: "");

    _isloading = false;
    if(networkData.isSuccess){
      _serverData = ProductsByRemarks.fromJson(networkData.responseBody);
      update();
      return true;

    }else{
      _error = networkData.errorMessage;
      update();
      return false;

    }


  }



}