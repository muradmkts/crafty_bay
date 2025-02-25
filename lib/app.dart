import 'package:crafty_bay/controller_bindgs.dart';
import 'package:crafty_bay/user_interface/screens/home.dart';
import 'package:crafty_bay/user_interface/screens/splash.dart';
import 'package:crafty_bay/user_interface/utils/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBuindings(),
      title: "Crafty Bay",
      home: Splash(),
      theme: ThemeData(
          iconButtonTheme: IconButtonThemeData(
              style: IconButton.styleFrom(
                  backgroundColor: ThemeColor.gray.withAlpha(100),
                  foregroundColor: ThemeColor.softBlack)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColor.aqua,
                  foregroundColor: Colors.white,
                  fixedSize: Size(double.maxFinite, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            hintStyle: TextStyle(color: ThemeColor.gray),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: ThemeColor.aqua)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: ThemeColor.aqua)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: ThemeColor.aqua)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.red)),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ThemeColor.aqua,
            unselectedItemColor: ThemeColor.gray,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          )),
    );
  }
}
