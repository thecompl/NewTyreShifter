import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Widget/Appbartext.dart';
import 'MessageScreen.dart';
import '../Widget/BottomBar.dart';
import '../Widget/Textfield.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.skylight,
      appBar:PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: inbox,show_arrow_icon: 1,)),

      // Appbartext().appbar(
      //     inbox,
      //     TextStyles.withColor(TextStyles.mb16, color.black),
      //     context,1,0),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return inbox_card("Nalini", "What is Status", "12:09");
            }),
      ),
      // bottomNavigationBar: BottomBar(index: 2),
    );
  }

  inbox_card(name, status, time) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        nextScreen(context, MessageScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 5),
        child: Container(
          decoration: BoxDecoration(
              color: color.white,
              border: Border.all(color: color.border_grey1_color),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child:
                          Image.asset(service_img, fit: BoxFit.cover)), //Text
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textfield().text(
                              name,
                              TextStyles.withletterspacing(TextStyles.mb16,
                                  color.txt_dark_blue_color, 0.5, 1.2)),
                          Textfield().text(
                              time,
                              TextStyles.withletterspacing(TextStyles.mb16,
                                  color.txt_dark_blue_color, 0.5, 1.2)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Textfield().text(
                            status,
                            TextStyles.withletterspacing(TextStyles.mb16,
                                color.txt_grey3_color, 0.5, 1.2)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
