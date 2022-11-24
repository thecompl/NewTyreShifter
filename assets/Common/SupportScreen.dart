import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/string.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../config/TextStyles/Textstyles.dart';

class SupportScreen extends StatefulWidget {
  SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController Write_Comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: support),),

      // Appbartext().appbar(
      //     support, TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                  child: Image.asset(
                supportimg,
                height: size.height * 0.25,
              )),
              SizedBox(height: 40),
              textbox(name, enterfull_name_txt,TextInputType.text),
              SizedBox(height: 15),
              textbox(email, emailtxt,TextInputType.emailAddress),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: color.white,
                      border: Border.all(color: color.border_grey_color),
                      borderRadius: BorderRadius.circular(25)),
                  height: size.height * 0.2,
                  width: size.width,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        controller: Write_Comment,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: what_is_issue,
                            hintStyle: TextStyles.mn14),
                      )),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: size.width,
                child: ElevatedButtons(
                  onTap: () {},
                  name: send,
                ),
              )
              // SizedBox(
              //   width: size.width,
              //   child: Elevatedbuttons().elevatedbutton(send, null, context),
              // )
            ],
          ),
        ),
      ),
    );
  }

  textbox(contrl, hint,keyboeard_type) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 55,
        decoration: BoxDecoration(
            color: color.white,
            border: Border.all(color: color.border_grey_color),
            borderRadius: BorderRadius.circular(15)),
        width: size.width,
        child: TextField(
          keyboardType: keyboeard_type,
          controller: contrl,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle:
                  TextStyles.withColor(TextStyles.mn14, color.textgrey_color)),
        ),
      ),
    );
  }
}
