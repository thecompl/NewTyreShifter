import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tyreshifter/Customer/Assistance_immediately.dart';
import 'package:tyreshifter/Customer/Assistance_immediately3.dart';
import 'package:tyreshifter/Widget/Texboxwidget.dart';

import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/provider/cartypecontroller.dart';
import '../Models/Cartype.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../Widget/Dropdown.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import '../config/Color.dart';
import 'Immediate_Request.dart';
import 'Payement.dart';

class Assistance_immediately2 extends StatefulWidget {
  final type;
  Assistance_immediately2({Key? key, this.type}) : super(key: key);

  @override
  State<Assistance_immediately2> createState() =>
      _Assistance_immediately2State();
}

class _Assistance_immediately2State extends State<Assistance_immediately2> {
  var _chosenValue_time = "11:00 Am";
  var _chosenValue_vehicle = "sydan";
  String? typecar = suv;
  List time = ["11:00 Am", "12:00 Am", "10:00 Am"];

  List vehicle_type = [];
  List vehicle_type_id = [];

  DateTime? pickedDate = DateTime.now();
  TextEditingController numbercar = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController address = TextEditingController();

  final Cartypecontroller getxcartypecontroller = Get.put(Cartypecontroller());

  Cartype? cartypemodel;

  @override
  void initState() {
    getxcartypecontroller.getcartype(context);
    print("hii" + getxcartypecontroller.carlist.toString());
    for (var i = 0; i < getxcartypecontroller.carlist.length; i++) {
      setState(() {
        vehicle_type.add(getxcartypecontroller.carlist[i]['carType']);
        vehicle_type_id.add(getxcartypecontroller.carlist[i]['carTypeId']);
      });
    }
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
          child: Appbartext(
            title: Assistance,
          ),
        ),

        // Appbartext().appbar(
        //     widget.type == "1" ? tyreshift_immidiate : send_req,
        //     TextStyles.withColor(TextStyles.mb16, color.black),
        //     context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                TextBoxwidget(
                  keyboradtype: TextInputType.number,
                  hinttext: "Registration number",
                  hintstyle: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  controller: numbercar,
                  border_color: color.border_grey_color,
                  style: TextStyles.withColor(TextStyles.mb14, color.black),
                  ontap: () {
                    // print("hii");
                    // opendatepiker();
                    // setState(() {
                    //   date.text = DateFormat('dd/MM/yyyy')
                    //       .format(pickedDate!)
                    //       .toString();
                    // });
                  },
                  prefixshowicon: false,
                  readtype: false,
                  showicon: false,
                ),

                SizedBox(
                  height: 20,
                ),

                TextBoxwidget(
                  hinttext: "114, zoo chopati pawder USA",
                  hintstyle: TextStyles.withColor(TextStyles.mb14, color.black),
                  controller: address,
                  border_color: color.border_grey_color,
                  style: TextStyles.withColor(TextStyles.mb14, color.black),
                  ontap: () {
                    setState(() {
                      address.text = "114, zoo chopati pawder USA";
                    });
                  },
                  prefixshowicon: false,
                  readtype: true,
                  iconorimage: true,
                  imagepath: location_vector,
                ),
                // SizedBox(
                //   height: 20,
                // ),

                SizedBox(
                  height: 25,
                ),
                TextBoxwidget(
                  keyboradtype: TextInputType.number,
                  hinttext: "How many tyres need repair?",
                  hintstyle: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  controller: numbercar,
                  border_color: color.border_grey_color,
                  style: TextStyles.withColor(TextStyles.mb14, color.black),
                  ontap: () {
                    // print("hii");
                    // opendatepiker();
                    // setState(() {
                    //   date.text = DateFormat('dd/MM/yyyy')
                    //       .format(pickedDate!)
                    //       .toString();
                    // });
                  },
                  prefixshowicon: false,
                  readtype: false,
                  showicon: false,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  cartype,
                  style: TextStyles.withColor(
                      TextStyles.mn16, color.textgrey_color),
                ).paddingSymmetric(horizontal: 5),

                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // GetStorage().write("subtype", become_shifter);
                          setState(() {
                            typecar = become_shifter;
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
                                scale: 1.2,
                                child: Radio(
                                    value: suv,
                                    groupValue: typecar,
                                    onChanged: (value) {
                                      setState(() {
                                        typecar = value.toString();
                                        print("value" + value.toString());
                                      });
                                      // set_typeaccount();
                                    }),
                              ),
                              Textfield().text(
                                suv,
                                TextStyles.withColor(
                                    TextStyles.mn16, color.textgrey_color, 1.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      GestureDetector(
                        onTap: () {
                          // print("hii");
                          // GetStorage().write("type", get_shifter);
                          setState(() {
                            typecar = normal;
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
                                scale: 1.2,
                                child: Radio(
                                    value: normal,
                                    groupValue: typecar,
                                    onChanged: (value) {
                                      setState(() {
                                        typecar = value.toString();
                                        print("fe =>" + value.toString());
                                      });
                                      // set_typeaccount();
                                    }),
                              ),
                              Textfield().text(
                                normal,
                                TextStyles.withColor(
                                    TextStyles.mn16, color.textgrey_color, 1.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                ElevatedButtons(
                  name: next,
                  onTap: () {
                    nextScreen(context, Assistance_immediately3());
                  },
                )
              ],
            ),
          ),
        ));
  }

  }
