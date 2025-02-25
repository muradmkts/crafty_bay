import 'package:crafty_bay/state_holders/login_controller.dart';
import 'package:crafty_bay/user_interface/screens/otp.dart';
import 'package:crafty_bay/user_interface/utils/input_verification.dart';
import 'package:crafty_bay/user_interface/widgets/bottom_popup_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/assets.dart';
import '../utils/theme_color.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _onEmailSubmission(BuildContext context)async{
    if (_formKey.currentState!.validate()) {
      final bool success = await Get.find<LoginController>().getLogin(_emailController.text.trim());
      if(success){
        Get.to(Otp(email: _emailController.text.trim(),));
      }else{
        bottomPopupMessage(context, "Please check your network connection", true);
      }

    }else {
      bottomPopupMessage(context, "Please enter a email address", true);
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
                height: MediaQuery
                    .sizeOf(context)
                    .height / 10),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "Welcome Back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Please Enter Your Email Address",
                style: TextStyle(color: ThemeColor.softBlack),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  onFieldSubmitted:(String text){
                  _onEmailSubmission(context);
                },
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value != null) {
                      if (value
                          .trim()
                          .isEmpty) {
                        return "Please enter an email address!";
                      } else
                      if (!InputVerification.emailValidator.hasMatch(value)) {
                        return "Please enter a valid email address";
                      } else {
                        return null;
                      }
                    }
                    else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: "Email Address"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GetBuilder<LoginController>(
                builder: (controller) {
                  return Visibility(
                    visible: !controller.isLoading,
                    replacement: CircularProgressIndicator(
                      color: ThemeColor.aqua,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          _onEmailSubmission(context);},
                        child: Text("Next")),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
