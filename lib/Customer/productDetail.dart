import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/Customer/Assistance_Cart.dart';
import 'package:tyreshifter/Customer/Assistance_immediately.dart';

import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Common/CalenderScreen.dart';
import '../Widget/Appbartext.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Send_request.dart';

class ProductDetail extends StatefulWidget {
  final type;
  ProductDetail({Key? key, this.type}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    log(widget.type.toString());
    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: book_a_servicetxt),
      ),
      // Appbartext().appbar(
      //     home, TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * .95,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                                color: color.border_grey4_color, width: 1)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                        child: Center(
                            child: Image.asset(
                          tyre_img,
                          fit: BoxFit.cover,
                          height: 310,
                        ))),
                    SizedBox(
                      height: 20,
                    ),
                    Textfield().text(
                        "UNIROYAL 255 35 R19 96Y RAINSPORT 5",
                        TextStyles.withColor(
                            TextStyles.mb20, color.text_grey2_color, 1.3)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Textfield().text(
                            "??139.23",
                            TextStyles.withColor(TextStyles.mb18,
                                color.Primary_second_Color, 1.3)),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          line_img,
                          fit: BoxFit.cover,
                          height: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Textfield().text(
                            "Per tyre, fitted.",
                            TextStyles.withColor(
                                TextStyles.mn14, color.txt_dark_color, 1.3)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textfield().text(
                            brand,
                            TextStyles.withColor(
                                TextStyles.mb14, color.textblackcolor, 1.3)),
                        SizedBox(
                          width: 10,
                        ),
                        Textfield().text(
                            "UNIROYAL",
                            TextStyles.withColor(
                                TextStyles.mn14, color.txt_dark_color, 1.3)),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textfield().text(
                            stocknumber,
                            TextStyles.withColor(
                                TextStyles.mb14, color.textblackcolor, 1.3)),
                        SizedBox(
                          width: 9,
                        ),
                        Textfield().text(
                            "2553519YUN0361100000",
                            TextStyles.withColor(
                                TextStyles.mn14, color.txt_dark_color, 1.3)),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textfield().text(
                            tyrewidth,
                            TextStyles.withColor(
                                TextStyles.mb14, color.textblackcolor, 1.3)),
                        SizedBox(
                          width: 10,
                        ),
                        Textfield().text(
                            "255",
                            TextStyles.withColor(
                                TextStyles.mn14, color.txt_dark_color, 1.3)),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textfield().text(
                            tyreprofile,
                            TextStyles.withColor(
                                TextStyles.mb14, color.textblackcolor, 1.3)),
                        SizedBox(
                          width: 10,
                        ),
                        Textfield().text(
                            "35",
                            TextStyles.withColor(
                                TextStyles.mn14, color.txt_dark_color, 1.3)),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textfield().text(
                            wheeldiameter,
                            TextStyles.withColor(
                                TextStyles.mb14, color.textblackcolor, 1.3)),
                        SizedBox(
                          width: 10,
                        ),
                        Textfield().text(
                            "19",
                            TextStyles.withColor(
                                TextStyles.mn14, color.txt_dark_color, 1.3)),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textfield().text(
                            speedrating,
                            TextStyles.withColor(
                                TextStyles.mb14, color.textblackcolor, 1.3)),
                        SizedBox(
                          width: 10,
                        ),
                        Textfield().text(
                            "Y",
                            TextStyles.withColor(
                                TextStyles.mn14, color.txt_dark_color, 1.3)),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textfield().text(
                            loadindex,
                            TextStyles.withColor(
                                TextStyles.mb14, color.textblackcolor, 1.3)),
                        SizedBox(
                          width: 10,
                        ),
                        Textfield().text(
                            "96",
                            TextStyles.withColor(
                                TextStyles.mn14, color.txt_dark_color, 1.3)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.type != 0)
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Textfield().text(
                                  qty,
                                  TextStyles.withColor(TextStyles.mb14,
                                      color.textblackcolor, 1.3)),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        color: color.border_grey4_color,
                                        width: 1)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 15),
                                child: Textfield().text(
                                    "1",
                                    TextStyles.withColor(
                                      TextStyles.mb20,
                                      color.textblackcolor,
                                      1.3,
                                    ),
                                    TextAlign.center),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
                ElevatedButtons(
                  width: widget.type != 0 ? 0.6 : 0.9,
                  height: 60,
                  name: addtocart,
                  onTap: () {
                    // nextScreen(context, widget.type == "0"? HomeCalendarPage():Send_Request(type: widget.type));
                    nextScreen(context, Assistance_Cart(type: widget.type));
                    // nextScreen(context, Send_Request(type: widget.type));
                  },
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
