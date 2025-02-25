import 'package:crafty_bay/state_holders/login_state_controller.dart';
import 'package:crafty_bay/user_interface/screens/login.dart';
import 'package:crafty_bay/user_interface/utils/assets.dart';
import 'package:crafty_bay/user_interface/utils/theme_color.dart';
import 'package:crafty_bay/user_interface/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Future<void> _initalize() async {
    final bool isLoggedIn = await Get.find<LoginStateController>().checkLoginState();
    if(isLoggedIn){
      Get.off(BottomNavBar());

    }else{

      Get.off(Login());
    }

  }

  @override
  void initState() {
    super.initState();
    _initalize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          children: [
            Spacer(),
            SvgPicture.asset(Assets.logo, height: MediaQuery.sizeOf(context).height/8,),
            Spacer(),
            CircularProgressIndicator(
              color: ThemeColor.aqua,
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 16.0, top: 16),
              child: Text("version 1.0"),
            ),


          ],

        ),
      ),

    );
  }
}
