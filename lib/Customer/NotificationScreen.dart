import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Textfield.dart';
import '../config/string.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(40):Size.fromHeight(40+10),
        child: Appbartext(title: notification),),
      // Appbartext().appbar(notification,
      //     TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return NotificationScreen_card(
                      notification_pink, "Summer tires accept your request");
                }
                return NotificationScreen_card(
                    notification_blue, "Summer tires accept your request");
              }),
        ),
      ),
    );
  }

  NotificationScreen_card(Img, txt) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 8),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset(
                Img,
                height: size.height * 0.06,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Textfield().text(
                    txt,
                    TextStyles.withletterspacing(
                        TextStyles.mb16, color.text_grey2_color, 0.5, 1.2)),
              )
            ],
          ),
        ),
      ),
    );
  }

}
