import 'package:crafty_bay/models/network_response.dart';
import 'package:crafty_bay/models/review_data.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:get/get.dart';

import '../user_interface/utils/urls.dart';

class ReviewDataController extends GetxController{


  bool _isLoading =false;
  bool get isLoading => _isLoading;

  ReviewData? _reviewData;
  ReviewData? get reviewData => _reviewData;


  Future<bool> getServerData(String productId) async {
    _isLoading = true;
    update();

    NetworkResponse networkResponse = await NetworkCaller.getResponse(url: Urls.reviews(productId: productId), token: "");
    _isLoading = false;

    if(networkResponse.isSuccess){
      _reviewData = ReviewData.fromJson(networkResponse.responseBody);
      print(_reviewData);
      update();

      return true;

    }else{

      update();
      return false;

    }


  }




}