import 'package:crafty_bay/state_holders/otp_timer_controller.dart';
import 'package:crafty_bay/state_holders/otp_verify_controller.dart';
import 'package:crafty_bay/user_interface/screens/complete_profile.dart';
import 'package:crafty_bay/user_interface/screens/home.dart';
import 'package:crafty_bay/user_interface/utils/theme_color.dart';
import 'package:crafty_bay/user_interface/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import '../../state_holders/login_controller.dart';
import '../utils/assets.dart';
import '../widgets/bottom_popup_message.dart';

class Otp extends StatelessWidget {
  Otp({super.key, required this.email});


  final String email;
  final TextEditingController _tECOtp = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onOtpSubmission(BuildContext context) async{
    if (_formKey.currentState!.validate()) {
      final bool success = await Get.find<OtpVerifyController>().sendOtp(email, _tECOtp.text);
      if(success && !Get.find<OtpVerifyController>().isProfileExist){
        bottomPopupMessage(context, "Please complete your profile", false);
        Get.to(CompleteProfile());
      }else if(success){
        Get.offAll(BottomNavBar());
      }else{
        bottomPopupMessage(context, "OTP is not correct", true);

      }
    }
  }
  Future<void> _resentOtp(BuildContext context)async{
    final bool success = await Get.find<LoginController>().getLogin(email);
    if(!success){
      bottomPopupMessage(context, "Please check your network connection", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.logo,
                height: MediaQuery.sizeOf(context).height / 10),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "Enter OTP Code",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "A 6 digit OTP code has been sent",
                style: TextStyle(color: ThemeColor.softBlack),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Form(
                key: _formKey,
                child: PinCodeTextField(
                  controller: _tECOtp,
                  autovalidateMode: AutovalidateMode.disabled,
                  validator: (String? i) {
                    if (i != null) {
                      if (i.trim().length < 6) {
                        return 'Enter the OTP to proceed!';
                      }
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  length: 6,
                  obscureText: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 45,
                      fieldWidth: 45,
                      activeFillColor: Colors.transparent,
                      activeColor: const Color(0XFFFE9900),
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: ThemeColor.aqua,
                      selectedColor: const Color(0XFFFE9900),
                      selectedFillColor: Colors.transparent),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    _onOtpSubmission(context);
                  },
                  appContext: context,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: GetBuilder<OtpVerifyController>(
                builder: (controller) {
                  return Visibility(
                    visible: !controller.isLoading,
                      replacement: CircularProgressIndicator(
                        color: ThemeColor.aqua,),
                      child: ElevatedButton(onPressed: (){_onOtpSubmission(context);}, child: Text("Next")));
                }
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: GetBuilder<OTPTimerController>(
                builder: (controller) {
                  return RichText(
                      text: TextSpan(
                          style: TextStyle(color: ThemeColor.softBlack),
                          text: "The code will expire in ",
                          children: [
                        TextSpan(
                          text: "${controller.remainingSeconds}s",
                          style: TextStyle(color: ThemeColor.aqua),
                        )
                      ]));
                }
              ),
            ),
            GetBuilder<LoginController>(
              builder: (controller) {
                return Visibility(
                  visible: !controller.isLoading,
                  replacement: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(height:25, width:25,child: CircularProgressIndicator(color: ThemeColor.aqua,)),
                  ),
                  child: TextButton(
                      onPressed: () {
                        if(Get.find<OTPTimerController>().remainingSeconds==0) _resentOtp(context);
                      },
                      child: GetBuilder<OTPTimerController>(
                        builder: (controllerTwo) {
                          return Text(
                            "Resend Code",
                            style: TextStyle(color: controllerTwo.remainingSeconds!=0?ThemeColor.softBlack:ThemeColor.aqua),
                          );
                        }
                      )),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
