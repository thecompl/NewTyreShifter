import 'dart:core';
import 'dart:core';
import 'dart:io';

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
                      TextStyles.mb18, color.Primary_second_Color),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.string(leftarrowsvg),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.string(rightarrowsvg),
                  ],
                ).paddingOnly(top: 10),
              ],
            ).paddingSymmetric(horizontal: 15, vertical: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 300,
                // width: size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
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
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  midrange,
                  style: TextStyles.withColor(
                      TextStyles.mb18, color.Primary_second_Color),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.string(leftarrowsvg),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.string(rightarrowsvg),
                  ],
                ).paddingOnly(top: 10),
              ],
            ).paddingSymmetric(horizontal: 15, vertical: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 300,
                // width: size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
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
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  premium,
                  style: TextStyles.withColor(
                      TextStyles.mb18, color.Primary_second_Color),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.string(leftarrowsvg),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.string(rightarrowsvg),
                  ],
                ).paddingOnly(top: 10),
              ],
            ).paddingSymmetric(horizontal: 15, vertical: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 300,
                // width: size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
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
                    }),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ]),
        ));
    // ),
  }
}
