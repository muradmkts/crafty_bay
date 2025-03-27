import 'package:crafty_bay/state_holders/add_cart_controller.dart';
import 'package:crafty_bay/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/state_holders/category_data_controller.dart';
import 'package:crafty_bay/state_holders/delete_cart_controller.dart';
import 'package:crafty_bay/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/state_holders/login_controller.dart';
import 'package:crafty_bay/state_holders/login_state_controller.dart';
import 'package:crafty_bay/state_holders/nav_controller.dart';
import 'package:crafty_bay/state_holders/otp_timer_controller.dart';
import 'package:crafty_bay/state_holders/otp_verify_controller.dart';
import 'package:crafty_bay/state_holders/product_details_controller.dart';
import 'package:crafty_bay/state_holders/products_by_category_controller.dart';
import 'package:crafty_bay/state_holders/products_by_remarks_controller.dart';
import 'package:crafty_bay/state_holders/review_data_controller.dart';
import 'package:crafty_bay/state_holders/size_and_color_controller.dart';
import 'package:get/get.dart';

class ControllerBuindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => OTPTimerController(), fenix: true);
    Get.lazyPut(() => OtpVerifyController(), fenix: true);
    Get.lazyPut(() => ProductsByCategoryController(), fenix: true);
    Get.lazyPut(()=> SizeAndColorController(), fenix: true);
    Get.lazyPut(()=> ProductDetailsController(), fenix: true);
    Get.lazyPut(()=>ReviewDataController(), fenix:  true);
    Get.lazyPut(()=>AddCartController(), fenix:  true);
    Get.lazyPut(()=>CartListController(), fenix:  true);
    Get.lazyPut(()=>DeleteCartController(), fenix:  true);
    Get.put(LoginStateController());
    Get.put(NavController());
    Get.put(CategoryDataController());
    Get.put(HomeSliderController());
    Get.put(ProductsByRemarksController());

  }
}
