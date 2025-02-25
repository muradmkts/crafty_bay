import 'package:crafty_bay/state_holders/category_data_controller.dart';
import 'package:crafty_bay/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/state_holders/login_controller.dart';
import 'package:crafty_bay/state_holders/login_state_controller.dart';
import 'package:crafty_bay/state_holders/nav_controller.dart';
import 'package:crafty_bay/state_holders/otp_timer_controller.dart';
import 'package:crafty_bay/state_holders/otp_verify_controller.dart';
import 'package:crafty_bay/state_holders/products_by_remarks_controller.dart';
import 'package:get/get.dart';

class ControllerBuindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => OTPTimerController(), fenix: true);
    Get.lazyPut(() => OtpVerifyController(), fenix: true);
    Get.put(LoginStateController());
    Get.put(NavController());
    Get.put(CategoryDataController());
    Get.put(HomeSliderController());
    Get.put(ProductsByRemarksController());
  }
}
