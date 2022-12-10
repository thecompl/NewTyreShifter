import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyreshifter/Common/CalenderScreen.dart';
import 'package:tyreshifter/Customer/Assistance_immediately2.dart';
import 'package:tyreshifter/Customer/Assistance_immediately3.dart';
import 'package:tyreshifter/Suppliers/Complete_Order.dart';
import 'package:tyreshifter/Suppliers/SetupPrice.dart';

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

class Select_Services extends StatefulWidget {
  final type;
  const Select_Services({Key? key, this.type}) : super(key: key);

  @override
  _Select_ServicesState createState() => _Select_ServicesState();
}

class _Select_ServicesState extends State<Select_Services> {
  bool servicetype1 = false;
  bool servicetype2 = false;
  bool servicetype3 = false;
  bool servicetype4 = false;
  bool servicetype5 = false;
  bool servicetype6 = false;

  String? type_account;
  bool isChecked = false;
  String question = 'Q 1', answer = 'A 3', defaultValue = 'nil';
  List<String> _texts = [
    "InduceSmile.com",
    "Flutter.io",
    "google.com",
    "youtube.com",
    "yahoo.com",
    "gmail.com"
  ];
  List<bool> _isChecked = [false];
  @override
  void initState() {
    _isChecked = List<bool>.filled(_texts.length, false);
    GetStorage().write("lang", "English");
    GetStorage().write("type", become_shifter);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: service),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
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
              Container(
                decoration: BoxDecoration(
                  color: color.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: _texts.length,
                      //     itemBuilder: (cc, index) {
                      //       return CheckboxListTile(
                      //         title: Text(_texts[index]),
                      //         value: _isChecked[index],
                      //         onChanged: (val) {
                      //           setState(
                      //             () {
                      //               _isChecked[index] = val!;
                      //             },
                      //
                      //           log(_isChecked.toString());
                      //         },
                      //       );
                      //     }),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          selectservicesupplier,
                          textAlign: TextAlign.center,
                          style: TextStyles.mb18,
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          // print("hii");
                          // GetStorage().write("type", get_shifter);
                          setState(() {
                            servicetype1 = true;
                            // set_typeaccount();
                          });
                        },
                        child: Container(
                          width: size.width * 0.7,
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //         color: color.Primary_second_Color)),
                          child: Row(
                            children: [
                              servicetype1
                                  ? Image.asset(
                                      'assets/checkedcircle.png',
                                      height: 20,
                                    )
                                  : Image.asset(
                                      'assets/unselectcircle.png',
                                      height: 20,
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Textfield().text(
                                tyreReplacement,
                                TextStyles.withColor(
                                    TextStyles.mn18, color.textgrey_color, 1.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          // print("hii");
                          // GetStorage().write("type", get_shifter);
                          setState(() {
                            servicetype2 = !servicetype2;
                            // set_typeaccount();
                          });
                        },
                        child: Container(
                          width: size.width * 0.7,
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //         color: color.Primary_second_Color)),
                          child: Row(
                            children: [
                              servicetype2
                                  ? Image.asset(
                                      'assets/checkedcircle.png',
                                      height: 20,
                                    )
                                  : Image.asset(
                                      'assets/unselectcircle.png',
                                      height: 20,
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Textfield().text(
                                wheelalignment,
                                TextStyles.withColor(
                                    TextStyles.mn18, color.textgrey_color, 1.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          // print("hii");
                          // GetStorage().write("type", get_shifter);
                          setState(() {
                            servicetype3 = !servicetype3;
                            // set_typeaccount();
                          });
                        },
                        child: Container(
                          width: size.width * 0.7,
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //         color: color.Primary_second_Color)),
                          child: Row(
                            children: [
                              servicetype3
                                  ? Image.asset(
                                      'assets/checkedcircle.png',
                                      height: 20,
                                    )
                                  : Image.asset(
                                      'assets/unselectcircle.png',
                                      height: 20,
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Textfield().text(
                                punctureRepair,
                                TextStyles.withColor(
                                    TextStyles.mn18, color.textgrey_color, 1.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          // GetStorage().write("type", become_shifter);
                          setState(() {
                            servicetype4 = !servicetype4;
                            // set_typeaccount();
                          });
                        },
                        child: Container(
                          // width: size.width * 0.7,
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //         color: color.Primary_second_Color)),
                          child: Row(
                            children: [
                              servicetype4
                                  ? Image.asset(
                                      'assets/checkedcircle.png',
                                      height: 20,
                                    )
                                  : Image.asset(
                                      'assets/unselectcircle.png',
                                      height: 20,
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Textfield().text(
                                flatbattery,
                                TextStyles.withColor(
                                    TextStyles.mn18, color.textgrey_color, 1.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          // GetStorage().write("type", become_shifter);
                          setState(() {
                            servicetype5 = !servicetype5;
                          });
                        },
                        child: Container(
                          // width: size.width * 0.7,
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //         color: color.Primary_second_Color)),
                          child: Row(
                            children: [
                              servicetype5
                                  ? Image.asset(
                                      'assets/checkedcircle.png',
                                      height: 20,
                                    )
                                  : Image.asset(
                                      'assets/unselectcircle.png',
                                      height: 20,
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Textfield().text(
                                batteryreplacement,
                                TextStyles.withColor(
                                    TextStyles.mn18, color.textgrey_color, 1.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          // GetStorage().write("type", become_shifter);
                          setState(() {
                            servicetype6 = !servicetype6;
                          });
                        },
                        child: Container(
                          // width: size.width * 0.7,
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //         color: color.Primary_second_Color)),
                          child: Row(
                            children: [
                              servicetype6
                                  ? Image.asset(
                                      'assets/checkedcircle.png',
                                      height: 20,
                                    )
                                  : Image.asset(
                                      'assets/unselectcircle.png',
                                      height: 20,
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Textfield().text(
                                oilchange,
                                TextStyles.withColor(
                                    TextStyles.mn18, color.textgrey_color, 1.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButtons(
                  name: done,
                  onTap: () {
                    nextScreen(
                        context,
                        SetupPrice(
                            type: widget.type, servicetype: tyreReplacement));
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
