import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/user_interface/widgets/add_subtreuct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/theme_color.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: ThemeColor.softBlack,
              )),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
              items: [Placeholder()],
              options: CarouselOptions(
                viewportFraction: 1,
                height: 250,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 250,
                    child: Text(
                      "Happy NewYear special Deal, Happy NewYear Deal,",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: ThemeColor.softBlack),
                    )),
                AddSubtreuct(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
