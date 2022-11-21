import 'dart:core';
import 'dart:core';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tyreshifter/Customer/Assistance_immediately.dart';
import 'package:tyreshifter/Customer/Assistance_tyreListDetail.dart';
import 'package:tyreshifter/Customer/productDetail.dart';
import 'package:tyreshifter/Widget/Assistance_immediately_Card.dart';
import 'package:tyreshifter/Widget/ProductListwidget.dart';
import 'package:tyreshifter/Widget/Texboxwidget.dart';

import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/provider/cartypecontroller.dart';
import '../Models/Cartype.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../Widget/Dropdown.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import '../config/Color.dart';
import 'Immediate_Request.dart';
import 'Payement.dart';

class ProductList extends StatefulWidget {
  final type;

  ProductList({Key? key, this.type}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final Cartypecontroller getxcartypecontroller = Get.put(Cartypecontroller());
  bool btnchange = false;
  @override
  void initState() {
    getxcartypecontroller.getcartype(context);
      log("pro"+widget.type.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 10),
                  Container(
                    // width: size.height,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 2 : 3,
                          mainAxisExtent: 325,
                        ),
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductListwidget(
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
                ]),
          ),
    );
    // ),
  }
}
