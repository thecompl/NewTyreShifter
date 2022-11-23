import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:tyreshifter/Suppliers/Set_Availability.dart';
import 'package:tyreshifter/Suppliers/SetupFees_detail.dart';
import 'package:tyreshifter/Suppliers/SetupPriceImmediately.dart';
import 'package:tyreshifter/Suppliers/SetupPrice_detail.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/SetupPriceCardWidget.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Textfield.dart';
import '../config/string.dart';
import '../provider/Pricetypectrl.dart';

class SetupPrice extends StatefulWidget {
  final type;
  final servicetype;
  SetupPrice({Key? key, this.type, this.servicetype}) : super(key: key);

  @override
  State<SetupPrice> createState() => _SetupPriceState();
}

class _SetupPriceState extends State<SetupPrice> {
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
        child: Appbartext(title: setup_price, show_arrow_icon: 0),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textfield().text(bookedServices, TextStyles.mb18),
                SizedBox(height: 10),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return SetupPriceCardWidget(
                        title: "Tyres",
                        service: normalcars,
                        showIcon: true,
                        icon: Icons.arrow_forward_ios,
                        Oncardtap: () {
                          nextScreen(
                              context,
                              SetupPrice_detail(
                                title: "Tyres",
                              ));
                        },
                      );
                    }),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: (() {
                    nextScreen(
                        context,
                        SetupFees_detail(
                          title: fees,
                        ));
                  }),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textfield().text(
                              fees,
                              TextStyles.withColor(
                                  TextStyles.mb14, color.txt_dark_color),
                              TextAlign.center),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: color.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Textfield().text(Assistance, TextStyles.mb18),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    nextScreen(context, SetupPriceImmediately());
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textfield().text(
                              services,
                              TextStyles.withColor(
                                  TextStyles.mb14, color.txt_dark_color),
                              TextAlign.center),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: color.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
