import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyreshifter/Common/CalenderScreen.dart';
import 'package:tyreshifter/Customer/Assistance_afterTyre.dart';
import 'package:tyreshifter/Customer/Assistance_immediately2.dart';
import 'package:tyreshifter/Customer/Dialogs/Delete_dialog.dart';
import 'package:tyreshifter/Customer/Dialogs/immediately_pun.dart';
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

class Assistanceimmediately extends StatefulWidget {
  final type;
  const Assistanceimmediately({Key? key, this.type}) : super(key: key);

  @override
  _AssistanceimmediatelyState createState() => _AssistanceimmediatelyState();
}

class _AssistanceimmediatelyState extends State<Assistanceimmediately> {
  String? type;
  String? service = punctureRepair;

  String? type_account;
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
      // Appbartext().appbar(
      //       '',
      //       TextStyles.withColor(TextStyles.mb16, color.black),
      //       context,
      //       1,0,'',0.0,0.0),

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
                            setState(() {
                              service = flatbattery;
                            });
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.5,
                                  child: Radio(
                                      value: flatbattery,
                                      groupValue: service,
                                      onChanged: (value) {
                                        setState(() {
                                          service = value.toString();
                                          print("value" + value.toString());
                                        });
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
                            setState(() {
                              service = tyreReplacement;
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
                                      groupValue: service,
                                      onChanged: (value) {
                                        setState(() {
                                          service = value.toString();
                                          // print("fe =>" + value.toString());
                                        });
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
                        // Container(),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              service = punctureRepair;
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
                                      groupValue: service,
                                      onChanged: (value) {
                                        setState(() {
                                          service = value.toString();
                                          // print("fe =>" + value.toString());
                                        });
                                        // set_typeaccount();
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
                  name: next,
                  onTap: () {
                    service == tyreReplacement
                        ? nextScreen(context,
                            Assistance_afterTyre(service: service, type: type))
                        : service == punctureRepair
                            ? showDialog(
                                context: context,
                                builder: (context) => Immediately_pun(
                                      title: punctureRepair,
                                      desc: punctureRepairmsg,
                                      btn: proceed,
                                      Onbtn: () {
                                        nextScreen(
                                            context,
                                            Assistance_immediately2(
                                                service: service, type: type));
                                      },
                                    ))
                            : nextScreen(
                                context,
                                Assistance_immediately2(
                                    service: service, type: type));
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
