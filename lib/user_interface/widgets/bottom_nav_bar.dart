import 'package:crafty_bay/state_holders/category_data_controller.dart';
import 'package:crafty_bay/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/state_holders/nav_controller.dart';
import 'package:crafty_bay/user_interface/screens/cart.dart';
import 'package:crafty_bay/user_interface/screens/categories.dart';
import 'package:crafty_bay/user_interface/screens/home.dart';
import 'package:crafty_bay/user_interface/screens/wishlist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme_color.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool _isLoading =true;

  Future<void> _initialize() async{
    await Future.delayed(Duration(seconds: 0));
    bool categoryIsGot = await Get.find<CategoryDataController>().getCategoryList();
    bool productListSlidersIsGot = await Get.find<HomeSliderController>().getHomeSlider();
    if(categoryIsGot&&productListSlidersIsGot){
      setState(() {_isLoading=false;});
    }
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> listOfScreens = [
      Home(),
      Categories(),
      Cart(),
      Wishlist(),
    ];
    return GetBuilder<NavController>(builder: (controller) {
      return Scaffold(
        body: Visibility(
          visible: !_isLoading,
            replacement: Center(
              child: CircularProgressIndicator(
                color: ThemeColor.aqua,
              ),
            ),
            child: listOfScreens[controller.index]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.index,
            onTap: (int i) {
              controller.navigate(index: i);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.window_outlined), label: "Category"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: "Wishlist")
            ]),
      );
    });
  }
}
