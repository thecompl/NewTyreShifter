import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:tyreshifter/Suppliers/Set_Availability.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/SetupPriceCardWidget.dart';
import 'package:tyreshifter/Widget/SetupPriceWidget.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Textfield.dart';
import '../config/string.dart';
import '../provider/Pricetypectrl.dart';

class SetupFees_detail extends StatefulWidget {
  final type;
  final title;
  final servicetype;
  SetupFees_detail({Key? key, this.type, this.servicetype, this.title})
      : super(key: key);

  @override
  State<SetupFees_detail> createState() => _SetupFees_detailState();
}

class _SetupFees_detailState extends State<SetupFees_detail> {
  static String _valueToString(double value) {
    return value.toStringAsFixed(0);
  }

  @override
  void initState() {
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
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return SetupPriceCardWidget(
                        title: replacement,
                        service: normalcars,
                        price: '£300',
                        // Oncardtap: () {
                        //   log("message");
                        //   // nextScreen(context, page)
                        // },
                      );
                    }),
                SizedBox(height: 20),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textfield().text(
                            distancefee,
                            TextStyles.withColor(
                                TextStyles.mb14, color.txt_dark_color),
                            TextAlign.center),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Textfield().text(
                                      '0-15 KM',
                                      TextStyles.withColor(TextStyles.mb14,
                                          color.txt_dark_color),
                                      TextAlign.center),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: Textfield().text(
                                          '£100',
                                          TextStyles.withColor(TextStyles.mb14,
                                              color.txt_dark_color),
                                          TextAlign.center),
                                    ),
                                  )
                                ],
                              ).paddingSymmetric(vertical: 10);
                            }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
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
