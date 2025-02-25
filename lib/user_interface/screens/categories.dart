import 'package:crafty_bay/state_holders/category_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../utils/theme_color.dart';

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
                            Container(
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
                          ],
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
