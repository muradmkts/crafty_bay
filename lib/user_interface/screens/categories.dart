import 'package:crafty_bay/state_holders/category_data_controller.dart';
import 'package:crafty_bay/state_holders/products_by_category_controller.dart';
import 'package:crafty_bay/user_interface/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';
import '../utils/theme_color.dart';
import '../widgets/bottom_popup_message.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: GetBuilder<CategoryDataController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: controller.serverData?.data?.length??0,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: ()async {
                            final bool isSuccess = await Get.find<ProductsByCategoryController>().getServerData(controller.serverData!.data![i].id!.toString());
                            if(isSuccess){ Get.to(Products(appbarTitle: controller.serverData!.data![i].categoryName!, allProducts: Get.find<ProductsByCategoryController>().products!));}
                            else{
                              bottomPopupMessage(context, "Something went wrong! Try again.", true);
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 85,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ThemeColor.softAqua),
                              ),
                              GetBuilder<ProductsByCategoryController>(
                                builder: (controllerTwo) {
                                  return Visibility(
                                    visible: !controllerTwo.isLoading,
                                    replacement: CircularProgressIndicator(
                                      color: ThemeColor.aqua,
                                    ),
                                    child: Container(
                                      height: 70,
                                      width: 75,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(controller
                                                  .serverData!
                                                  .data![i]
                                                  .categoryImg!),
                                              fit: BoxFit.scaleDown),
                                          borderRadius: BorderRadius.circular(10),
                                          color: ThemeColor.softAqua),
                                    ),
                                  );
                                }
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(controller.serverData!.data![i].categoryName!)
                    ],
                  );

            },



            ),
          );
        }
      ),
    );
  }
}
