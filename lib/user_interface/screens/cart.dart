import 'package:crafty_bay/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/user_interface/screens/login.dart';
import 'package:crafty_bay/user_interface/utils/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/add_subtreuct.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<void> initialFunction ()async {
    bool apiCaller = await Get.find<CartListController>().getCartList();
    if(apiCaller == false){
      Future.delayed(Duration(seconds: 0));
      Get.to(()=>Login());
    }
  }
  @override
  void initState() {
    initialFunction();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: GetBuilder<CartListController>(
        builder: (controller) {
          return Visibility(
            replacement: Center(
              child: CircularProgressIndicator(
                color: ThemeColor.aqua,
              ),
            ),
            visible: !controller.isLoading,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: ListView.builder(

                    itemCount: controller.cartListData?.data?.length??0,
                        itemBuilder: (context, i) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0.5,
                        shadowColor: ThemeColor.gray,
                        child: Container(
                            height: 120,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 125,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  controller.cartListData?.data?[i].product?.image??"https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                child: Text(controller.cartListData?.data?[i].product?.title??"No Data Found",
                                                  style: TextStyle(
                                                      color: ThemeColor.softBlack,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w700),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                "Color: Red, Size: X",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: ThemeColor.softBlack
                                                        .withAlpha(150),
                                                    fontWeight: FontWeight.w600),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "\$${499 * i + 10}",
                                            style: TextStyle(
                                                color: ThemeColor.aqua,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, top: 12, bottom: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          child: Icon(
                                        Icons.delete_outlined,
                                        color: ThemeColor.gray,
                                      )),
                                      AddSubtreuct()
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      );
                    }),
                  ),
                ),
                Container(
                  height: 85,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ThemeColor.aqua.withAlpha(30),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(17), topRight: Radius.circular(17))

                  ),
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
                            Text("Total Price", style: TextStyle(fontSize: 12, color: ThemeColor.softBlack, fontWeight: FontWeight.w600),),
                            Text("\$453,943,549", style: TextStyle(color: ThemeColor.aqua, fontSize: 16, fontWeight: FontWeight.w700),)
                          ],
                        ),
                        SizedBox(width: 130, child: ElevatedButton(onPressed: (){}, child: Text("Checkout", style: TextStyle(fontWeight: FontWeight.w400),)))],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
