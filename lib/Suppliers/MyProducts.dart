import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:tyreshifter/Customer/Cancelledrequest.dart';
import 'package:tyreshifter/Customer/Completed.dart';
import 'package:tyreshifter/Customer/Inprogress.dart';
import 'package:tyreshifter/Customer/ProductList.dart';

import 'package:tyreshifter/config/Color.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Assistance_immediately_Card.dart';
import '../Widget/Assistance_immediately_Cart.dart';
import '../Widget/Button.dart';
import '../Widget/Customer_Req_Card.dart';
import '../Widget/Textfield.dart';
import '../Widget/Toggle.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';

class MyProducts extends StatefulWidget {
  final type;
  MyProducts({Key? key, this.type}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  bool value = true;

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
          child: Appbartext(title: products),
        ),
        // Appbartext().appbar(
        //     my_req, TextStyles.withColor(TextStyles.mb16, color.black), context),
        body: value == true
            ? SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          child: Container(
                            // elevation: 0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: color.border_grey4_color, width: 0.5),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9.0),
                              child: Assistance_immediately_Cart(
                                adddress: availableqty + "5",
                                price: "£139.23",
                                headtxt: 'UNIROYAL 255 35 R19 96Y RAINSPORT 5',
                                Img: tyre_img,
                                btnname: working,
                                btncolor: color.btncolor3,
                                quantity: '1',
                                height: 125,
                                Ontap: () {
                                  // nextScreen(
                                  //     context,
                                  //     Assistance_tyreListDetail(
                                  //         // dropdown: true,
                                  //         // pagetype: booking_details,
                                  //         // status: working
                                  //         ));
                                },
                                Ontapdelete: () {},
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            : Container(
                height: size.height,
                child: Center(child: SvgPicture.string(sadfaceicon)),
              ));
  }
}
