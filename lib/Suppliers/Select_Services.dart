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
  String? servicetype = punctureRepair;

  String? type_account;

  String question = 'Q 1', answer = 'A 3', defaultValue = 'nil';
  List<String> _texts = [
    "InduceSmile.com",
    "Flutter.io",
    "google.com",
    "youtube.com",
    "yahoo.com",
    "gmail.com"
  ];
  List<bool> _isChecked =[false];
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
                      //           );
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
                            servicetype = tyreReplacement;
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
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                    value: tyreReplacement,
                                    groupValue: servicetype,
                                    onChanged: (value) {
                                      setState(() {
                                        servicetype = value.toString();
                                        // print("fe =>" + value.toString());
                                      });
                                      // set_typeaccount();
                                    }),
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
                            servicetype = wheelalignment;
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
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                    value: wheelalignment,
                                    groupValue: servicetype,
                                    onChanged: (value) {
                                      setState(() {
                                        servicetype = value.toString();
                                        print("fe =>" + value.toString());
                                      });
                                      // set_typeaccount();
                                    }),
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
                            servicetype = punctureRepair;
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
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                    value: punctureRepair,
                                    groupValue: servicetype,
                                    onChanged: (value) {
                                      setState(() {
                                        servicetype = value.toString();
                                        // print("fe =>" + value.toString());
                                      });
                                      // set_servicetypeaccount();
                                    }),
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
                            servicetype = flatbattery;
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
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                    value: flatbattery,
                                    groupValue: servicetype,
                                    onChanged: (value) {
                                      setState(() {
                                        servicetype = value.toString();
                                        print("value" + value.toString());
                                      });
                                      // set_typeaccount();
                                    }),
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
                            servicetype = batteryreplacement;
                          });
                        },
                        child: Container(
                          // width: size.width * 0.7,
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //         color: color.Primary_second_Color)),
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                    value: batteryreplacement,
                                    groupValue: servicetype,
                                    onChanged: (value) {
                                      setState(() {
                                        servicetype = value.toString();
                                        print("value" + value.toString());
                                      });
                                    }),
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
                            servicetype = oilchange;
                          });
                        },
                        child: Container(
                          // width: size.width * 0.7,
                          // decoration: BoxDecoration(
                          //     border: Border.all(
                          //         color: color.Primary_second_Color)),
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                    value: oilchange,
                                    groupValue: servicetype,
                                    onChanged: (value) {
                                      setState(() {
                                        servicetype = value.toString();
                                        print("value" + value.toString());
                                      });
                                    }),
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
                            type: widget.type, servicetype: servicetype));
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
