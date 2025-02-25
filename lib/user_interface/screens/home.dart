import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/state_holders/category_data_controller.dart';
import 'package:crafty_bay/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/state_holders/nav_controller.dart';
import 'package:crafty_bay/user_interface/utils/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../utils/assets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int sliderIndexNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          Assets.logoNav,
          height: MediaQuery.sizeOf(context).height / 33,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_2_outlined),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.call_outlined)),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_active_outlined)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: "Search",
                  hintStyle:
                      TextStyle(color: ThemeColor.softBlack.withAlpha(120)),
                  filled: true,
                  fillColor: ThemeColor.gray.withAlpha(100),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent)),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child:
                        GetBuilder<HomeSliderController>(builder: (controller) {
                      return CarouselSlider(
                        items: controller.serverData!.data!.map((slider) {
                          return Builder(builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width-20,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      SizedBox(
                                          width: 200,
                                          child: Text(slider.price??"", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(110, 30)

                                        ),
                                          onPressed: (){},
                                          child: Text("Buy Now"))

                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        image: NetworkImage(slider.image ??
                                            "https://images.pexels.com/photos/1537671/pexels-photo-1537671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          });
                        }).toList(),
                        options: CarouselOptions(
                          onPageChanged: (int i, _){
                            setState(() {
                              sliderIndexNumber = i;
                            });
                          },
                          autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            viewportFraction: 1,
                            height: MediaQuery.sizeOf(context).height / 5,
                            aspectRatio: 16 / 9),
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 13,
                        width: 17,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: sliderIndexNumber==0?ThemeColor.aqua:ThemeColor.gray),
                      ),
                      Container(
                        height: 13,
                        width: 17,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: sliderIndexNumber==1?ThemeColor.aqua:ThemeColor.gray),
                      ),
                      Container(
                        height: 13,
                        width: 17,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: sliderIndexNumber==2?ThemeColor.aqua:ThemeColor.gray),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.find<NavController>().navigate(index: 1);
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                              color: ThemeColor.aqua,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child:
                    GetBuilder<CategoryDataController>(builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.serverData!.data!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int i) {
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
                      });
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: ThemeColor.aqua,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: ThemeColor.softBlack.withAlpha(60),
                                offset: Offset(0, -7),
                                blurRadius: 3,
                                spreadRadius: 0.3)
                          ]),
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
                                          "https://images.pexels.com/photos/1537671/pexels-photo-1537671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "New year spacial shoe",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("\$599",
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
                                              Text("4.8",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: ThemeColor
                                                          .softBlack)),
                                            ],
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: ThemeColor.aqua,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: ThemeColor.softBlack.withAlpha(100),
                                offset: Offset(0, -7),
                                blurRadius: 3,
                                spreadRadius: 0.3)
                          ]),
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
                                          "https://images.pexels.com/photos/1537671/pexels-photo-1537671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "New year spacial shoe",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("\$599",
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
                                              Text("4.8",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: ThemeColor
                                                          .softBlack)),
                                            ],
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: ThemeColor.aqua,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: ThemeColor.softBlack.withAlpha(100),
                                offset: Offset(0, -7),
                                blurRadius: 3,
                                spreadRadius: 0.3)
                          ]),
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
                                          "https://images.pexels.com/photos/1537671/pexels-photo-1537671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "New year spacial shoe",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("\$599",
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
                                              Text("4.8",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: ThemeColor
                                                          .softBlack)),
                                            ],
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
