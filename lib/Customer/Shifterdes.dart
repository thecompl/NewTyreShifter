import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/Customer/Assistance_immediately.dart';
import 'package:tyreshifter/Customer/Book_Service.dart';

import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Common/CalenderScreen.dart';
import '../Widget/Appbartext.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Send_request.dart';

class Shifter_Des extends StatefulWidget {
  final type;
  Shifter_Des({Key? key, this.type}) : super(key: key);

  @override
  State<Shifter_Des> createState() => _Shifter_DesState();
}

class _Shifter_DesState extends State<Shifter_Des> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height - 50;
    return Scaffold(
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: home),
      ),
      // Appbartext().appbar(
      //     home, TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Container(
            height: height * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Image.asset(logo_without_tag,
                            height: size.height * 0.2)),
                    SizedBox(
                      height: 40,
                    ),
                    Textfield().text(
                        widget.type == "0" ? reserveline1 : reserve1line1,
                        TextStyles.withColor(
                            TextStyles.mn16, color.textgrey_color, 1.3),
                        TextAlign.justify),
                    SizedBox(
                      height: 15,
                    ),
                    Textfield().text(
                        widget.type == "0" ? reserveline2 : reserve2line2,
                        TextStyles.withColor(
                            TextStyles.mn16, color.textgrey_color, 1.3),
                        TextAlign.justify),
                    SizedBox(
                      height: 15,
                    ),
                    Textfield().text(
                        widget.type == "0" ? reserveline3 : reserve3line3,
                        TextStyles.withColor(
                            TextStyles.mn16, color.textgrey_color, 1.3),
                        TextAlign.left),
                    SizedBox(
                      height: 15,
                    ),
                    Textfield().text(
                        widget.type == "0" ? reserveline4 : reserve4line4,
                        TextStyles.withColor(
                            TextStyles.mn16, color.textgrey_color, 1.3),
                        TextAlign.left),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                ElevatedButtons(
                  name: widget.type == "0" ? reserve : continu,
                  onTap: () {
                    // nextScreen(context, widget.type == "0"? HomeCalendarPage():Send_Request(type: widget.type));
                    nextScreen(
                        context,
                        widget.type == "0"
                            ? Book_Service(type: widget.type)
                            // HomeCalendarPage()
                            : Assistanceimmediately(type: widget.type));
                    // nextScreen(context, Send_Request(type: widget.type));
                  },
                ),

                // Elevatedbuttons().elevatedbutton(
                // Elevatedbuttons().elevatedbutton(
                //     widget.type == "0" ? reserve : continu,
                //     Send_Request(type: widget.type),
                //     context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
