import 'dart:core';
import 'dart:core';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tyreshifter/Customer/Assistance_immediately.dart';
import 'package:tyreshifter/Customer/Assistance_tyreListDetail.dart';
import 'package:tyreshifter/Customer/Dialogs/Cancel_req_dialog.dart';
import 'package:tyreshifter/Customer/Dialogs/delete_dialog.dart';
import 'package:tyreshifter/Customer/ProductList.dart';
import 'package:tyreshifter/Widget/Assistance_immediately_Card.dart';
import 'package:tyreshifter/Widget/Assistance_immediately_Cart.dart';
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

class Assistance_Cart extends StatefulWidget {
  final type;
  Assistance_Cart({Key? key, this.type}) : super(key: key);

  @override
  State<Assistance_Cart> createState() => _Assistance_CartState();
}

class _Assistance_CartState extends State<Assistance_Cart> {
  bool applypromo = false;
  String? promodata;

  TextEditingController promo = TextEditingController();

  final Cartypecontroller getxcartypecontroller = Get.put(Cartypecontroller());

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
            title: review_popup,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 5),
              Text(
                location,
                style: TextStyles.withColor(
                    TextStyles.mb18, color.text_grey2_color),
              ).paddingSymmetric(vertical: 5),
              Text(
                "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                style: TextStyles.withColor(
                    TextStyles.mn18, color.text_grey2_color),
              ).paddingSymmetric(vertical: 0),
              SizedBox(height: 25),
              Container(
                // width: size.height,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Assistance_immediately_Cart(
                        adddress: "Per tyre, fitted.",
                        price: "£139.23",
                        headtxt: 'UNIROYAL 255 35 R19 96Y RAINSPORT 5',
                        Img: tyre_img,
                        btnname: working,
                        btncolor: color.btncolor3,
                        quantity: '1',
                        showqtyrow: true,
                        Ontap: () {
                          // nextScreen(
                          //     context,
                          //     Assistance_tyreListDetail(
                          //         // dropdown: true,
                          //         // pagetype: booking_details,
                          //         // status: working
                          //         ));
                        },
                        Ontapdelete: () {
                          showDialog(
                              context: context,
                              builder: (context) => Delete_dialog(
                                    iconsvg: trash_iconsvg,
                                    iconheight: 50.0,
                                    title: deletefromcart,
                                    msg: deletemsg,
                                    cancellabel: no,
                                    confirmlabel: yes,
                                    Oncanceltap: () {
                                      backScreen(context);
                                    },
                                    Onconfirmtap: () {
                                      backScreen(context);
                                    },
                                  ));
                        },
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: color.border_grey4_color,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textfield().text(
                      totalcharge,
                      TextStyles.withColor(
                          TextStyles.mb14, color.textblackcolor, 1.3)),
                  SizedBox(
                    width: 10,
                  ),
                  Textfield().text(
                      "£417.69",
                      TextStyles.withColor(
                          TextStyles.mb14, color.txt_dark_color, 1.3)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textfield().text(
                      calloutfee,
                      TextStyles.withColor(
                          TextStyles.mb14, color.textblackcolor, 1.3)),
                  SizedBox(
                    width: 10,
                  ),
                  Textfield().text(
                      "£300.00",
                      TextStyles.withColor(
                          TextStyles.mb14, color.txt_dark_color, 1.3)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textfield().text(
                      distancefee,
                      TextStyles.withColor(
                          TextStyles.mb14, color.textblackcolor, 1.3)),
                  SizedBox(
                    width: 10,
                  ),
                  Textfield().text(
                      "£50.00",
                      TextStyles.withColor(
                          TextStyles.mb14, color.txt_dark_color, 1.3)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textfield().text(
                      serviceFee,
                      TextStyles.withColor(
                          TextStyles.mb14, color.textblackcolor, 1.3)),
                  SizedBox(
                    width: 10,
                  ),
                  Textfield().text(
                      "£25.00",
                      TextStyles.withColor(
                          TextStyles.mb14, color.txt_dark_color, 1.3)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              applypromo == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            // width: 242.0,
                            height: 55,
                            child: TextBoxwidget(
                              // width: width*0.4,
                              hinttext: "Apply Promo code here",
                              hintstyle: TextStyles.withColor(
                                  TextStyles.mn14, color.textgrey_color),
                              controller: promo,
                              border_color: color.Primary_second_Color,
                              style: TextStyles.withColor(
                                  TextStyles.mb14, color.black),
                              prefixshowicon: false,
                              readtype: false,
                              showicon: false,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButtons(
                            width: 0.26,
                            height: 58,
                            name: apply,
                            onTap: () {
                              setState(() {
                                applypromo = true;
                                promodata:
                                promo;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            // width: 232.0,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                    color: color.Primary_second_Color,
                                    width: 1)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Row(children: [
                              Icon(
                                Icons.check_circle_outline,
                                color: color.green_color,
                                size: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Textfield().text(
                                  "TYRE50" + " " + applied,
                                  TextStyles.withColor(TextStyles.mb14,
                                      color.textgrey_color, 1.3),
                                  TextAlign.center),
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButtons(
                            width: 0.26,
                            height: 58,
                            name: remove,
                            style: TextStyles.mn14,
                            colorbtn: color.border_grey5_color,
                            onTap: () {
                              setState(() {
                                promo.clear();
                                applypromo = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButtons(
                  name: proceed + "(£417.69)",
                  style: new TextStyle(
                      // color: Colors.grey,
                      // decoration: TextDecoration.lineThrough,
                      ),
                  onTap: () {
                    nextScreen(context, Payment());
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ));
    // ),
  }
}
