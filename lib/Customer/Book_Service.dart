import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyreshifter/Common/CalenderScreen.dart';
import 'package:tyreshifter/Customer/Assistance_immediately2.dart';
import 'package:tyreshifter/Customer/Assistance_immediately3.dart';
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

class Book_Service extends StatefulWidget {
  final type;
  const Book_Service({Key? key, this.type}) : super(key: key);

  @override
  _Book_ServiceState createState() => _Book_ServiceState();
}

class _Book_ServiceState extends State<Book_Service> {
  String? servicetype = punctureRepair;
  String? subtype = newtyre;

  String? type_account;
  @override
  void initState() {
    GetStorage().write("lang", "English");
    GetStorage().write("type", become_shifter);
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
        child: Appbartext(title: service),
      ),
      // Appbartext().appbar(
      //       '',
      //       TextStyles.withColor(TextStyles.mb16, color.black),
      //       context,
      //       1,0,'',0.0,0.0),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
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
                  // Container(
                  //   width: size.width * 0.75,
                  //   child: Textfield().text(
                  //     get_start_dmsg,
                  //     TextStyles.withColor(
                  //         TextStyles.mn18, color.textgrey_color, 1.2),
                  //     TextAlign.center,
                  //   ),
                  // ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                  TextStyles.withColor(TextStyles.mn18,
                                      color.textgrey_color, 1.2),
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
                                  TextStyles.withColor(TextStyles.mn18,
                                      color.textgrey_color, 1.2),
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
                                  TextStyles.withColor(TextStyles.mn18,
                                      color.textgrey_color, 1.2),
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
                                  TextStyles.withColor(TextStyles.mn18,
                                      color.textgrey_color, 1.2),
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
                                  TextStyles.withColor(TextStyles.mn18,
                                      color.textgrey_color, 1.2),
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
                                  TextStyles.withColor(TextStyles.mn18,
                                      color.textgrey_color, 1.2),
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
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButtons(
                  name: continu,
                  onTap: () {
                    // nextScreen(context, widget.type == "0"? HomeCalendarPage():Send_Request(type: widget.type));
                    nextScreen(
                        context,
                        servicetype == tyreReplacement
                            ? Assistance_immediately3(servicetype:servicetype,type: widget.type,)
                            : Assistance_immediately2(type: widget.type));
                    // nextScreen(context, Send_Request(type: widget.type));
                  },
                ),
              ),
              SizedBox(height: 20)
              // ElevatedButtons(
              //     name: get_started,
              //     onTap: () {
              //       nextScreen(context,
              //           type == become_shifter ? Register_req() : '');
              //     }),
              // SizedBox(
              //   height: 10,
              // )

              // Elevatedbuttons().elevatedbutton(
              //   get_started,
              //   Register_req(),
              //   context,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
