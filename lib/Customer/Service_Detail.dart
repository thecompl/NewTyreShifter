import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tyreshifter/Widget/Appbartext.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import '../Widget/Button.dart';
import '../Widget/ReviewCardwidget.dart';
import '../config/string.dart';
import 'Reviews.dart';
import 'Send_request.dart';

class Service_Detail extends StatefulWidget {
  final String? type;
  Service_Detail({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<Service_Detail> createState() => _Service_DetailState();
}

class _Service_DetailState extends State<Service_Detail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      appBar:PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: details,elevation: 0.0,),),

      // Appbartext().appbar(
      //     details, TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                detail_service_img,
                width: size.height,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Textfield().text("Summer tires", TextStyles.mb18),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5, bottom: 5),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: color.Primary_second_Color,
                      ),
                    ),
                    Container(
                      width: size.width * 0.5,
                      child: Textfield().text(
                          "752 Longbranch St.Calhoun, GA 30701",
                          TextStyles.withColor(
                              TextStyles.mn16, color.textgrey_color)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset(tryeicon_img),
                    ),
                    Textfield().text(
                        "kr840",
                        TextStyles.withColor(
                            TextStyles.mb16, color.Primary_second_Color))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color.skylight,
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(staricon, height: size.height * 0.035),
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
                          Image.asset(kmicon, height: size.height * 0.035),
                          SizedBox(
                            width: 10,
                          ),
                          Textfield().text("5 KM", TextStyles.mb16)
                        ],
                      ),
                    ])),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Textfield().text(des, TextStyles.mb16),
                  SizedBox(height: 10),
                  Textfield().text(
                      "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                      TextStyles.withletterspacing(
                          TextStyles.mn14, color.textgrey_color, 0.5))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Textfield().text(
                        review,
                        TextStyles.withColor(
                            TextStyles.mb16, color.text_grey2_color)),
                    GestureDetector(
                      onTap: () {
                        nextScreen(context, Reviews());
                      },
                      child: Textfield().text(
                          see_all,
                          TextStyles.withColor(
                              TextStyles.mb16, color.Primary_second_Color)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: ReviewCardwidget(
                        bgcolor: color.skylight1,
                        customer_name: 'Jhon doe',
                        custome_name_style: TextStyles.withletterspacing(
                            TextStyles.mb18, color.text_grey2_color, 0.5),
                        desstyle: TextStyles.withletterspacing(
                            TextStyles.mn14, color.textgrey_color, 0.3),
                        destxt:
                            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                        img: service_img,
                      ),
                    );
                  }),
            ),
          ],
        ),
      )),
      floatingActionButton: ElevatedButtons(
        name: send_req,
        onTap: () {
          nextScreen(context, Send_Request(type: widget.type));
        },
      ),
      // Elevatedbuttons().elevatedbutton(send_req, Send_Request(), context),
    );
  }
}
