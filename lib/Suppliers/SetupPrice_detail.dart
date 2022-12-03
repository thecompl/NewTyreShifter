import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:tyreshifter/Suppliers/Set_Availability.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/SetupPriceWidget.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Textfield.dart';
import '../config/string.dart';
import '../provider/Pricetypectrl.dart';

class SetupPrice_detail extends StatefulWidget {
  final type;
  final title;
  final List data;
  final servicetype;
  SetupPrice_detail({
    Key? key,
    this.type,
    this.servicetype,
    this.title,
    required this.data,
  }) : super(key: key);

  @override
  State<SetupPrice_detail> createState() => _SetupPrice_detailState();
}

class _SetupPrice_detailState extends State<SetupPrice_detail> {
  static String _valueToString(double value) {
    return value.toStringAsFixed(0);
  }

  @override
  void initState() {
    log("message===>" + widget.data.toString());
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
            title: setup_price + ' ' + 'for' + ' ' + widget.title,
            show_arrow_icon: 0),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SetupPriceWidget(
                        title: widget.data[index]['servicetitle'],
                        service: widget.data[index]['servicedetail'],
                        length: widget.data[index]['servicedetail'].length,
                        price: '£300',
                        // Oncardtap: () {
                        //   log("message");
                        //   // nextScreen(context, page)
                        // },
                      );
                    }),
                SizedBox(height: 40),
                ElevatedButtons(
                  name: done,
                  onTap: () {
                    nextScreen(context, Set_Availability(type: '0'));
                  },
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
