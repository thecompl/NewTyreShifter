import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyreshifter/Common/CalenderScreen.dart';
import 'package:tyreshifter/Customer/Assistance_immediately2.dart';
import 'package:tyreshifter/Suppliers/Complete_Order.dart';

import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/config/string.dart';

import '../Widget/Appbartext.dart';

import '../Suppliers/Register_Req.dart';
import '../Suppliers/Set_Availability.dart';
import '../Suppliers/Setprice.dart';
import '../Widget/Textfield.dart';

class Assistance_afterTyre extends StatefulWidget {
  final type;
  final service;

  const Assistance_afterTyre({Key? key, this.type, this.service})
      : super(key: key);

  @override
  _Assistance_afterTyreState createState() => _Assistance_afterTyreState();
}

class _Assistance_afterTyreState extends State<Assistance_afterTyre> {
  String? subtype = newtyre;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: Assistance),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: 40),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //     border:
                    //         Border.all(color: color.Primary_second_Color)),
                    child: Image.asset(
                      logo_without_tag,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    pleaseselect,
                    textAlign: TextAlign.center,
                    style: TextStyles.mb20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              subtype = newtyre;
                            });
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.2,
                                  child: Radio(
                                      activeColor: color.Primary_second_Color,
                                      value: newtyre,
                                      groupValue: subtype,
                                      onChanged: (value) {
                                        setState(() {
                                          subtype = value.toString();
                                          // print("value" + value.toString());
                                        });
                                      }),
                                ),
                                Textfield().text(
                                  newtyre,
                                  TextStyles.withColor(TextStyles.mn18,
                                      color.textgrey_color, 1.2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              subtype = oldtyre;
                            });
                          },
                          child: Container(
                            width: size.width * 0.7,
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.2,
                                  child: Radio(
                                      activeColor: color.Primary_second_Color,
                                      value: oldtyre,
                                      groupValue: subtype,
                                      onChanged: (value) {
                                        setState(() {
                                          subtype = value.toString();
                                          print("fe =>" + value.toString());
                                        });
                                      }),
                                ),
                                Textfield().text(
                                  oldtyre,
                                  TextStyles.withColor(TextStyles.mn18,
                                      color.textgrey_color, 1.2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButtons(
                  name: continu,
                  onTap: () {
                    nextScreen(context, Assistance_immediately2());
                  },
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
