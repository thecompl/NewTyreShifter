import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/Notetxt.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';

import '../Common/Login.dart';
import '../Widget/Appbartext.dart';
import '../config/string.dart';

import 'Welcome_Tyreshifter.dart';

class GetStarted_Suppliers extends StatefulWidget {
  const GetStarted_Suppliers({
    Key? key,
  }) : super(key: key);

  @override
  State<GetStarted_Suppliers> createState() => _GetStarted_SuppliersState();
}

class _GetStarted_SuppliersState extends State<GetStarted_Suppliers> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: '',show_arrow_icon: 1,elevation: 0.0,),),
        //
      // Appbartext().appbar(
      //     '',
      //     TextStyles.withColor(TextStyles.mb16, color.black),
      //     context,
      //     1,0,'',0.0,0.0),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: 20,
              ),
              Container(height: 150, child: Image.asset(logo_without_tag)),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  child: Textfield()
                      .text(Register_reqmsg, TextStyles.mb24, TextAlign.center),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Notetxt(txt: req_1),
              Notetxt(txt: req_2),
              Notetxt(txt: req_3),
              SizedBox(
                height: 20,
              ),
              ElevatedButtons(
                name: done,
                onTap: () {
                  nextScreen(context, Login());
                },
              ),
              Spacer(),
              Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      style: TextStyles.withColor(TextStyles.mn16, color.black),
                      text: 'if you do not fulfill the requirements above',
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' Click here',
                          style: TextStyles.withColor(
                              TextStyles.mn20, color.Primary_second_Color),
                        )
                      ])),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );

  }
}
