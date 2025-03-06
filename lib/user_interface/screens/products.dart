import 'package:crafty_bay/models/products_by_remarks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/theme_color.dart';

class Products extends StatelessWidget {
  const Products(
      {super.key, required this.appbarTitle, required this.allProducts});

  final String appbarTitle;
  final ProductsByRemarks allProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new_rounded, color: ThemeColor.softBlack,)),
          ),
          leadingWidth: 30,
          title: Text(appbarTitle),
        ),
        body: Visibility(
          visible: allProducts.products!.isNotEmpty,
          replacement: Center(
            child: Text("Nothing to display!"),
          ),
          child: GridView.builder(
              itemCount: allProducts.products!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 10),
              itemBuilder: (context, i) {
                return FittedBox(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                              color: ThemeColor.softAqua,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    allProducts.products![i].image!,
                                  ),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high)),
                        ),
                        Container(
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  allProducts.products![i].title!,
                                  style: TextStyle(
                                      fontSize: 10, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("\$${allProducts.products![i].price}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600)),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: ThemeColor.yellow,
                                        ),
                                        Text(
                                            allProducts.products![i].star!
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                                color: ThemeColor.softBlack)),
                                      ],
                                    ),
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: ThemeColor.aqua,
                                      ),
                                      child: Icon(
                                        Icons.favorite_outline,
                                        size: 11,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
