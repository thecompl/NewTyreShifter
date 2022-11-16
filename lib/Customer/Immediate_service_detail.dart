import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/config/Color.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../Widget/ConfirmationDialog.dart';
import '../Widget/Textfield.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Dialogs/Sent_request.dart';
import 'Dialogs/review_dialog.dart';

class Immediate_service_detail extends StatefulWidget {
  Immediate_service_detail({Key? key}) : super(key: key);

  @override
  State<Immediate_service_detail> createState() =>
      _Immediate_service_detailState();
}

class _Immediate_service_detailState extends State<Immediate_service_detail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: detail),),
      // Appbartext().appbar(
      //     detail, TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Textfield().text("Summer times", TextStyles.mb18),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        // decoration: BoxDecoration(
                        //     border:
                        //         Border.all(color: color.black)),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: color.Primary_second_Color,
                          size: 25,
                        ),
                      ),
                      Container(
                        width: size.width * 0.5,
                        child: Textfield().text(
                            "345, abc socity pandesara surat",
                            TextStyles.withColor(
                                TextStyles.mn16,
                                color.textgrey_color),
                            TextAlign.left,
                            TextOverflow.ellipsis),
                      )
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(

                            width: 30,
                            child:
                            Image.asset(tryeicon_img)),
                        Textfield().text(
                          "kr840",
                          TextStyles.withColor(
                              TextStyles.mb14,
                              color.Primary_second_Color),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: color.skylight,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(staricon, height: size.height * 0.04),
                            SizedBox(
                              width: 10,
                            ),
                            Textfield().text(
                                "4.5",
                                TextStyles.withColor(
                                    TextStyles.mn16, color.textgrey_color))
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(kmicon, height: size.height * 0.04),
                            SizedBox(
                              width: 15,
                            ),
                            Textfield().text("5 KM", TextStyles.mb16)
                          ],
                        ),
                      ])),
              SizedBox(
                height: 25,
              ),
              Textfield().text(service_detai, TextStyles.mb18),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      service_img,
                      height: size.height * 0.13,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textfield().text("Change Tyre", TextStyles.mb18),
                      SizedBox(
                        height: 10,
                      ),
                      Textfield().text("Honda Amaze", TextStyles.mn14),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: size.width * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textfield().text("30 April,2022", TextStyles.mb14),
                            Textfield().text("011:00 AM", TextStyles.mb14),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Textfield().text(before_after, TextStyles.mb18),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width * 0.75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        service_img,
                        height: size.height * 0.15,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        service_img,
                        height: size.height * 0.15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Textfield().text(payment_details, TextStyles.mb18),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textfield().text(
                      "Tansaction ID",
                      TextStyles.withColor(
                          TextStyles.mn18, color.text_grey2_color)),
                  Textfield().text(
                      "02568975",
                      TextStyles.withColor(
                          TextStyles.mb18, color.text_grey2_color)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textfield().text(
                      "Paid Via",
                      TextStyles.withColor(
                          TextStyles.mn18, color.text_grey2_color)),
                  Textfield().text(
                      "Credit Card",
                      TextStyles.withColor(
                          TextStyles.mb18, color.text_grey2_color)),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textfield().text(paymen_rec, TextStyles.mb18),
                  Image.asset(
                    pdf,
                    height: size.height * 0.07,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButtons(
                name: give_review,
                onTap: () {
                  showDialog(
                      context: context, builder: (context) => ReviewPopUp());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
