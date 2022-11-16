import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

class Send_Request extends StatefulWidget {
  final type;
  Send_Request({Key? key, this.type}) : super(key: key);

  @override
  State<Send_Request> createState() => _Send_RequestState();
}

class _Send_RequestState extends State<Send_Request> {
  var _chosenValue_time = "11:00 Am";
  var _chosenValue_vehicle = "sydan";
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
            title: widget.type == "1" ? tyreshift_immidiate : send_req,
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
              children: [
                SizedBox(
                  height: 40,
                ),
                widget.type == "0"
                    ? TextBoxwidget(
                        height: 55.0,
                        hinttext: "10/08/2022",
                        hintstyle:
                            TextStyles.withColor(TextStyles.mb14, color.black),
                        controller: date,
                        border_color: color.border_grey_color,
                        style:
                            TextStyles.withColor(TextStyles.mb14, color.black),
                        ontap: () {
                          opendatepiker();
                          setState(() {
                            date.text = DateFormat('dd/MM/yyyy')
                                .format(pickedDate!)
                                .toString();
                          });
                        },
                        prefixshowicon: false,
                        readtype: true,
                        iconorimage: true,
                        imagepath: calender,
                      )
                    : Container(),
                widget.type == "0"
                    ? SizedBox(
                        height: 20,
                      )
                    : Container(),
                widget.type == "0"
                    ? Dropdown(
                        dropdowncolor: Colors.transparent,
                        borderradius: 15,
                        width: size.width,
                        hinttxt: "Rating",

                        style:
                            TextStyles.withColor(TextStyles.mb14, color.black),
                        list: time,
                        current_value: _chosenValue_time,
                        // Textalignment: AlignmentDirectional.centerStart,
                        border_color: color.border_grey4_color,
                        height: 52,
                      )
                    : Container(),

                // GestureDetector(
                //   onTap: () {
                //     opendatepiker();
                //   },
                //   child: Container(
                //     decoration: BoxDecoration(
                //         border: Border.all(color: color.border_grey_color),
                //         borderRadius: BorderRadius.circular(15)),
                //     // height: size.height * 0.06,
                //     width: size.width,
                //     child: Padding(
                //       padding: const EdgeInsets.all(25),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             "11:00 AM",
                //             style: TextStyles.mb14,
                //           ),
                //           Icon(
                //             Icons.keyboard_arrow_down_sharp,
                //             color: color.Primary_second_Color,
                //             size: 30,
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
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
                Container(
                  child: Dropdown(
                    dropdowncolor: Colors.transparent,
                    borderradius: 15,
                    width: size.width,
                    hinttxt: "",
                    style: TextStyles.withColor(TextStyles.mb14, color.black),
                    list: vehicle_type,
                    current_value: _chosenValue_vehicle,
                    Textalignment: AlignmentDirectional.centerStart,
                    border_color: color.border_grey4_color,
                    height: 52,
                  ),
                ),

                // GestureDetector(
                //   onTap: () {
                //     // print("hii");
                //     // opendatepiker();
                //   },
                //   child: Container(
                //     decoration: BoxDecoration(
                //         border: Border.all(color: color.border_grey_color),
                //         borderRadius: BorderRadius.circular(15)),
                //     width: size.width,
                //     child: Padding(
                //       padding: const EdgeInsets.all(25),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             "114, zoo chopati pawder USA",
                //             style: TextStyles.withColor(
                //                 TextStyles.mb14, color.txt_dark_color),
                //           ),
                //           Image.asset(location_vector, height: 20)
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 20,
                ),
                TextBoxwidget(
                  keyboradtype: TextInputType.number,
                  hinttext: "Number Of Cars",
                  hintstyle: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  controller: numbercar,
                  border_color: color.border_grey_color,
                  style: TextStyles.withColor(TextStyles.mb14, color.black),
                  ontap: () {
                    print("hii");
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
                ElevatedButtons(
                  name: send_req,
                  onTap: () {
                    nextScreen(context, Payment());
                  },
                )
              ],
            ),
          ),
        ));
  }

  dropdown(List<dynamic> list, _chosenValue) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          border: Border.all(color: color.border_grey_color),
          borderRadius: BorderRadius.circular(15)),
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: DropdownButton<String>(
          iconSize: 30,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_sharp),
          underline: SizedBox(),
          value: _chosenValue,
          //elevation: 5,
          style: TextStyle(color: Colors.white),
          iconEnabledColor: color.Primary_second_Color,
          items: list.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
          hint: Text(
            "Vehicle Type",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          onChanged: (value) {
            setState(() {
              _chosenValue = value!;
            });
          },
        ),
      ),
    );
  }

  opendatepiker() async {
    DateTime? tmpdate = await showDatePicker(
        context: context, //context of current state
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));
    setState(() {
      pickedDate = tmpdate;
    });
    // if (pickedDate != null) {
    //   print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
    //   String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
    //   print(
    //       formattedDate); //formatted date output using intl package =>  2021-03-16
    // } else {
    //   print("Date is not selected");
    // }
  }
}
