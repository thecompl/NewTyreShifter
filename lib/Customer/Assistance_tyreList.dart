import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tyreshifter/Customer/Assistance_immediately.dart';
import 'package:tyreshifter/Customer/Assistance_tyreListDetail.dart';
import 'package:tyreshifter/Widget/Assistance_immediately_Card.dart';
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

class Assistance_tyreList extends StatefulWidget {
  final type;
  Assistance_tyreList({Key? key, this.type}) : super(key: key);

  @override
  State<Assistance_tyreList> createState() => _Assistance_tyreListState();
}

class _Assistance_tyreListState extends State<Assistance_tyreList> {
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
        backgroundColor: color.skylight,
        appBar: PreferredSize(
          preferredSize: Platform.isAndroid
              ? Size.fromHeight(appbarheight_android)
              : Size.fromHeight(appbarheight_ios),
          child: Appbartext(
            title: Assistance,
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 5),
            Text(
              budget,
              style: TextStyles.withColor(
                  TextStyles.mb18, color.Primary_second_Color),
            ).paddingSymmetric(horizontal: 15, vertical: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                // width: size.height,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Assistance_immediately_Card(
                        adddress: "Per tyre, fitted.",
                        price: "£139.23",
                        headtxt: 'UNIROYAL 255 35 R19 96Y RAINSPORT 5',
                        Img: tyre_img,
                        btnname: working,
                        btncolor: color.btncolor3,
                        Ontap: () {
                          nextScreen(
                              context,
                              Assistance_tyreListDetail(
                                  // dropdown: true,
                                  // pagetype: booking_details,
                                  // status: working
                                  ));
                        },
                      );
                    }),
              ),
            ),
            Text(
              midrange,
              style: TextStyles.withColor(
                  TextStyles.mb18, color.Primary_second_Color),
            ).paddingSymmetric(horizontal: 15, vertical: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                // width: size.height,
                child: ListView.builder(
                    // scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Assistance_immediately_Card(
                        adddress: "Per tyre, fitted.",
                        price: "£139.23",
                        headtxt: 'UNIROYAL 255 35 R19 96Y RAINSPORT 5',
                        Img: tyre_img,
                        btnname: working,
                        btncolor: color.btncolor3,
                        Ontap: () {
                          nextScreen(
                              context,
                              Assistance_tyreListDetail(
                                  // dropdown: true,
                                  // pagetype: booking_details,
                                  // status: working
                                  ));
                        },
                      );
                    }),
              ),
            ),
            Text(
              premium,
              style: TextStyles.withColor(
                  TextStyles.mb18, color.Primary_second_Color),
            ).paddingSymmetric(horizontal: 15, vertical: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                // width: size.height,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Assistance_immediately_Card(
                        adddress: "Per tyre, fitted.",
                        price: "£139.23",
                        headtxt: 'UNIROYAL 255 35 R19 96Y RAINSPORT 5',
                        Img: tyre_img,
                        btnname: working,
                        btncolor: color.btncolor3,
                        Ontap: () {
                          nextScreen(
                              context,
                              Assistance_tyreListDetail(
                                  // dropdown: true,
                                  // pagetype: booking_details,
                                  // status: working
                                  ));
                          //   nextScreen(
                          //       context,
                          //       Service_Details(
                          //           dropdown: true,
                          //           pagetype: booking_details,
                          //           status: working));
                        },
                      );
                    }),
              ),
            ),
          ]),
        ));
    // ),
  }
}
