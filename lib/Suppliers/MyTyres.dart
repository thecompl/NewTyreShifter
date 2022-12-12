import 'dart:core';
import 'dart:core';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tyreshifter/Customer/Assistance_immediately.dart';
import 'package:tyreshifter/Customer/Assistance_tyreListDetail.dart';
import 'package:tyreshifter/Widget/Assistance_immediately_Card.dart';
import 'package:tyreshifter/Widget/ProductListwidget.dart';
import 'package:tyreshifter/Widget/SupplierProductListwidget.dart';
import 'package:tyreshifter/Widget/Texboxwidget.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/provider/cartypecontroller.dart';
import '../Customer/productDetail.dart';
import '../Models/Cartype.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../Widget/Dropdown.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import '../config/Color.dart';

class MyTyres extends StatefulWidget {
  final type;
  MyTyres({Key? key, this.type}) : super(key: key);

  @override
  State<MyTyres> createState() => _MyTyresState();
}

class _MyTyresState extends State<MyTyres> {
  bool btnchange = false;
  final ScrollController _controller = ScrollController();
  final controller = CarouselController();
  final controller1 = CarouselController();
  final controller2 = CarouselController();
  final double _height = 100.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: color.white,
        appBar: PreferredSize(
          preferredSize: Platform.isAndroid
              ? Size.fromHeight(appbarheight_android)
              : Size.fromHeight(appbarheight_ios),
          child: Appbartext(
            title: mytyres,
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  budget,
                  style: TextStyles.withColor(
                      TextStyles.mb20, color.Primary_second_Color),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (() {
                          controller.previousPage();
                        }),
                        child: SvgPicture.string(leftarrowsvg)),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          controller.nextPage();
                        },
                        child: SvgPicture.string(rightarrowsvg)),
                  ],
                ).paddingOnly(top: 10),
              ],
            ).paddingSymmetric(horizontal: 20, vertical: 15),
            Container(
              height: 320,
              // width: size.width,
              child: CarouselSlider.builder(
                carouselController: controller,
                itemCount: 15,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return SupplierProductListwidget(
                    adddress: "Per tyre, fitted.",
                    price: "£139.23",
                    headtxt: 'UNIROYAL 255 35 R19 96Y RAINSPORT 5',
                    Img: tyre_img,
                    btnname: working,
                    btncolor: color.btncolor3,
                    added: btnchange,
                    Onbtntap: () {
                      setState(() {
                        btnchange = !btnchange;
                      });
                    },
                    Ontap: () {
                      nextScreen(
                          context,
                          ProductDetail(type: widget.type
                              // dropdown: true,
                              // pagetype: booking_details,
                              // status: working
                              ));
                    },
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 10 / 3,
                  viewportFraction: 0.5,
                  initialPage: 0,
                  enableInfiniteScroll: false,

                  padEnds: false,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    midrange,
                    style: TextStyles.withColor(
                        TextStyles.mb20, color.Primary_second_Color),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            controller2.previousPage();
                          },
                          child: SvgPicture.string(leftarrowsvg)),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            controller2.nextPage();
                          },
                          child: SvgPicture.string(rightarrowsvg)),
                    ],
                  ).paddingOnly(top: 10)
                ],
              ),
            ),
            Container(
              height: 320,
              // width: size.width,
              child: CarouselSlider.builder(
                carouselController: controller2,
                itemCount: 15,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return SupplierProductListwidget(
                    adddress: "Per tyre, fitted.",
                    price: "£139.23",
                    headtxt: 'UNIROYAL 255 35 R19 96Y RAINSPORT 5',
                    Img: tyre_img,
                    btnname: working,
                    btncolor: color.btncolor3,
                    added: btnchange,
                    Onbtntap: () {
                      setState(() {
                        btnchange = !btnchange;
                      });
                    },
                    Ontap: () {
                      nextScreen(
                          context,
                          ProductDetail(type: widget.type
                              // dropdown: true,
                              // pagetype: booking_details,
                              // status: working
                              ));
                    },
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 10 / 3,
                  viewportFraction: 0.5,
                  initialPage: 0,
                  enableInfiniteScroll: false,

                  padEnds: false,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    premium,
                    style: TextStyles.withColor(
                        TextStyles.mb20, color.Primary_second_Color),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            controller1.previousPage();
                          },
                          child: SvgPicture.string(leftarrowsvg)),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            controller1.nextPage();
                          },
                          child: SvgPicture.string(rightarrowsvg)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 320,
              // width: size.width,
              child: CarouselSlider.builder(
                carouselController: controller1,
                itemCount: 15,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return SupplierProductListwidget(
                    adddress: "Per tyre, fitted.",
                    price: "£139.23",
                    headtxt: 'UNIROYAL 255 35 R19 96Y RAINSPORT 5',
                    Img: tyre_img,
                    btnname: working,
                    btncolor: color.btncolor3,
                    added: btnchange,
                    Onbtntap: () {
                      setState(() {
                        btnchange = !btnchange;
                      });
                    },
                    Ontap: () {
                      nextScreen(
                          context,
                          ProductDetail(type: widget.type
                              // dropdown: true,
                              // pagetype: booking_details,
                              // status: working
                              ));
                    },
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 10 / 3,
                  viewportFraction: 0.5,
                  initialPage: 0,
                  enableInfiniteScroll: false,

                  padEnds: false,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ]),
        ));
    // ),
  }

  void _animateToIndex(int index) {
    _controller.animateTo(
      index * _height,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
}
