import 'package:crafty_bay/state_holders/review_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/theme_color.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reviews",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GetBuilder<ReviewDataController>(builder: (controller) {
          return Visibility(
            visible: !controller.isLoading,
            replacement: Center(
              child: CircularProgressIndicator(
                color: ThemeColor.aqua,
              ),
            ),
            child: ListView.builder(
                itemCount: controller.reviewData?.data?.length??0,
                itemBuilder: (context, i) {
                  return Card(
                    elevation: .5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              children: [
                                Icon(Icons.person),
                                Text(controller
                                    .reviewData!.data![i].profile!.cusName!),
                              ],
                            ),
                          ),
                          Text(
                            "imply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown p",
                            style: TextStyle(color: ThemeColor.softBlack),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: ThemeColor.aqua,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
