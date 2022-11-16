import 'dart:io';

import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: home),),
      // Appbartext().appbar(
      //     home, TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                  child:
                      Image.asset(logo_without_tag, height: size.height * 0.2)),
              SizedBox(
                height: 40,
              ),
              Textfield().text(
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  TextStyles.withColor(
                      TextStyles.mn16, color.textgrey_color, 1.3)),
              SizedBox(
                height: 10,
              ),
              Textfield().text(
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  TextStyles.withColor(
                      TextStyles.mn16, color.textgrey_color, 1.3)),
              SizedBox(
                height: 10,
              ),
              Textfield().text(
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  TextStyles.withColor(
                      TextStyles.mn16, color.textgrey_color, 1.3)),
              SizedBox(
                height: 20,
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButtons(
                  name: widget.type == "0" ? reserve : continu,
                  onTap: () {
                    // nextScreen(context, widget.type == "0"? HomeCalendarPage():Send_Request(type: widget.type));
                    nextScreen(context, widget.type == "0"? HomeCalendarPage():Assistanceimmediately  ());
                    // nextScreen(context, Send_Request(type: widget.type));
                  },
                ),
              ),
              SizedBox(
                height:20
              )

              // Elevatedbuttons().elevatedbutton(
              // Elevatedbuttons().elevatedbutton(
              //     widget.type == "0" ? reserve : continu,
              //     Send_Request(type: widget.type),
              //     context)
            ],
          ),
        ),
      ),
    );
  }
}
