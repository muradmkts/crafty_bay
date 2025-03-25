import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/models/AddCartData.dart';
import 'package:crafty_bay/state_holders/add_cart_controller.dart';
import 'package:crafty_bay/state_holders/product_details_controller.dart';
import 'package:crafty_bay/state_holders/review_data_controller.dart';
import 'package:crafty_bay/state_holders/size_and_color_controller.dart';
import 'package:crafty_bay/user_interface/screens/reviews.dart';
import 'package:crafty_bay/user_interface/widgets/add_subtreuct.dart';
import 'package:crafty_bay/user_interface/widgets/bottom_popup_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/theme_color.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });

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
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        return Visibility(
          visible: !controller.isLoading,
          replacement: Center(
            child: CircularProgressIndicator(
              color: ThemeColor.aqua,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                          items: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .productDetailsData!.data![0].img1!),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .productDetailsData!.data![0].img2!),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .productDetailsData!.data![0].img3!),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .productDetailsData!.data![0].img4!),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: 250,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 250,
                                child: Text(
                                  controller.productDetailsData!.data![0]
                                      .product!.title!,
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
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 5),
                            child: Icon(
                              Icons.star,
                              color: ThemeColor.yellow,
                            ),
                          ),
                          Text(controller
                              .productDetailsData!.data![0].product!.star!
                              .toString()),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 10),
                            child: InkWell(
                              onTap: () {
                                Get.find<ReviewDataController>().getServerData(
                                    controller.productDetailsData!.data![0].id!
                                        .toString());
                                Get.to(() => Reviews());
                              },
                              child: Text(
                                "Reviews",
                                style: TextStyle(color: ThemeColor.aqua),
                              ),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ThemeColor.aqua,
                            ),
                            child: Icon(
                              Icons.favorite_outline,
                              size: 14,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 15, bottom: 3),
                        child: Text(
                          "Color",
                          style: TextStyle(
                              color: ThemeColor.softBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: GetBuilder<SizeAndColorController>(
                            builder: (controller) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.selectColor(index: 0);
                                },
                                child: Container(
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: controller.colorIndex == 0
                                          ? ThemeColor.aqua
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: controller.colorIndex == 0
                                              ? ThemeColor.aqua
                                              : ThemeColor.softBlack,
                                          width: 2)),
                                  child: Center(
                                      child: Text(
                                    controller.productColors[0],
                                    style: TextStyle(
                                        color: controller.colorIndex == 0
                                            ? Colors.white
                                            : ThemeColor.softBlack,
                                        fontWeight: FontWeight.w500),
                                  )),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                  onTap: () {
                                    controller.selectColor(index: 1);
                                  },
                                  child: Container(
                                    width: 55,
                                    decoration: BoxDecoration(
                                        color: controller.colorIndex == 1
                                            ? ThemeColor.aqua
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                            color: controller.colorIndex == 1
                                                ? ThemeColor.aqua
                                                : ThemeColor.softBlack,
                                            width: 2)),
                                    child: Center(
                                        child: Text(
                                      controller.productColors[1],
                                      style: TextStyle(
                                          color: controller.colorIndex == 1
                                              ? Colors.white
                                              : ThemeColor.softBlack,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.selectColor(index: 2);
                                },
                                child: Container(
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: controller.colorIndex == 2
                                          ? ThemeColor.aqua
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: controller.colorIndex == 2
                                              ? ThemeColor.aqua
                                              : ThemeColor.softBlack,
                                          width: 2)),
                                  child: Center(
                                      child: Text(
                                    controller.productColors[2],
                                    style: TextStyle(
                                        color: controller.colorIndex == 2
                                            ? Colors.white
                                            : ThemeColor.softBlack,
                                        fontWeight: FontWeight.w500),
                                  )),
                                ),
                              )
                            ],
                          );
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 15, bottom: 5),
                        child: Text("Size",
                            style: TextStyle(
                                color: ThemeColor.softBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: GetBuilder<SizeAndColorController>(
                            builder: (controllerTwo) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  controllerTwo.selectSize(index: 0);
                                },
                                borderRadius: BorderRadius.circular(360),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: controllerTwo.sizeIndex == 0
                                          ? ThemeColor.aqua
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: controllerTwo.sizeIndex == 0
                                              ? ThemeColor.aqua
                                              : ThemeColor.softBlack,
                                          width: 2)),
                                  child: Center(
                                    child: Text(
                                      controllerTwo.productSizes[0],
                                      style: TextStyle(
                                          color: controllerTwo.sizeIndex == 0
                                              ? ThemeColor.white
                                              : ThemeColor.softBlack,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(360),
                                onTap: () {
                                  controllerTwo.selectSize(index: 1);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: controllerTwo.sizeIndex == 1
                                          ? ThemeColor.aqua
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: controllerTwo.sizeIndex == 1
                                              ? ThemeColor.aqua
                                              : ThemeColor.softBlack,
                                          width: 2)),
                                  child: Center(
                                    child: Text(
                                      controllerTwo.productSizes[1],
                                      style: TextStyle(
                                          color: controllerTwo.sizeIndex == 1
                                              ? ThemeColor.white
                                              : ThemeColor.softBlack,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  controllerTwo.selectSize(index: 2);
                                },
                                borderRadius: BorderRadius.circular(360),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: controllerTwo.sizeIndex == 2
                                          ? ThemeColor.aqua
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: controllerTwo.sizeIndex == 2
                                              ? ThemeColor.aqua
                                              : ThemeColor.softBlack,
                                          width: 2)),
                                  child: Center(
                                    child: Text(
                                      controllerTwo.productSizes[2],
                                      style: TextStyle(
                                          color: controllerTwo.sizeIndex == 2
                                              ? ThemeColor.white
                                              : ThemeColor.softBlack,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                        child: Text("Description",
                            style: TextStyle(
                                color: ThemeColor.softBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          textAlign: TextAlign.justify,
                          controller.productDetailsData!.data![0].des!,
                          style: TextStyle(color: ThemeColor.softBlack),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GetBuilder<AddCartController>(
                builder: (controllerThree) {
                  return Visibility(
                    visible: !controllerThree.isLoading,
                    replacement: Center(child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: CircularProgressIndicator(color: ThemeColor.aqua,),
                    ),),
                    child: Container(
                      height: 85,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: ThemeColor.aqua.withAlpha(30),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: ThemeColor.softBlack,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "\$${controller.productDetailsData!.data![0].product!.price!}",
                                  style: TextStyle(
                                      color: ThemeColor.aqua,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(
                                width: 130,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      final bool serverCall =
                                          await controllerThree.addCart(
                                              cartDetails: AddCartData(
                                                  productId: controller
                                                      .productDetailsData
                                                      ?.data![0]
                                                      .id,
                                                  size: Get.find<SizeAndColorController>()
                                                              .sizeIndex ==
                                                          0
                                                      ? "X"
                                                      : Get.find<SizeAndColorController>()
                                                                  .sizeIndex ==
                                                              1
                                                          ? "2X"
                                                          : "3X",
                                                color: Get.find<SizeAndColorController>()
                                                    .colorIndex ==
                                                    0
                                                    ? "Red"
                                                    : Get.find<SizeAndColorController>()
                                                    .colorIndex ==
                                                    1
                                                    ? "Green"
                                                    : "White",
                                                qty: AddSubtreuct.itemCount
                                              ));
                                      if(serverCall){
                                        bottomPopupMessage(context, "Cart added", false);
                                      }else{
                                        bottomPopupMessage(context, "Please Try again", true);
                                      }
                                    },
                                    child: Text(
                                      "Add To Cart",
                                      style: TextStyle(fontWeight: FontWeight.w400),
                                    )))
                          ],
                        ),
                      ),
                    ),
                  );
                }
              )
            ],
          ),
        );
      }),
    );
  }
}
