import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/Widget/Notification_Card.dart';
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
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title:notification),),

      // Appbartext().appbar(notification,
      //     TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: size.height,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              if (index % 2 == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Notification_Card(
                      Img: notification_pink,
                      txt: "Summer tires accept your request",
                      style: TextStyles.withletterspacing(
                        TextStyles.mb16,
                        color.text_grey2_color,
                        0.5,
                      )),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Notification_Card(
                    Img: notification_blue,
                    txt: "Summer tires accept your request",
                    style: TextStyles.withletterspacing(
                        TextStyles.mb16, color.text_grey2_color, 0.5)),
              );
            }),
      ),
    );
  }
}
