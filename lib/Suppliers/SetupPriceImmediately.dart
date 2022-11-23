import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:tyreshifter/Suppliers/Set_Availability.dart';
import 'package:tyreshifter/Suppliers/SetupFees_detail.dart';
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

class SetupPriceImmediately extends StatefulWidget {
  final type;
  final servicetype;
  SetupPriceImmediately({Key? key, this.type, this.servicetype})
      : super(key: key);

  @override
  State<SetupPriceImmediately> createState() => _SetupPriceImmediatelyState();
}

class _SetupPriceImmediatelyState extends State<SetupPriceImmediately> {
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
        child: Appbartext(title: assfixedprice, show_arrow_icon: 0),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Textfield().text(explanation, TextStyles.mb18),
              SizedBox(height: 10),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: color.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Container(
                              child: SvgPicture.asset(
                                checkcircle,
                                height: 20,
                              ),
                            ),
                          ),
                          Container(
                              width: size.width * 0.78,
                              child: Textfield()
                                  .text(assimmediatelymsg1, TextStyles.mb16)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Container(
                              child: SvgPicture.asset(
                                checkcircle,
                                height: 20,
                              ),
                            ),
                          ),
                          Container(
                              width: size.width * 0.78,
                              child: Textfield()
                                  .text(assimmediatelymsg2, TextStyles.mb16)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Container(
                              child: SvgPicture.asset(
                                checkcircle,
                                height: 20,
                              ),
                            ),
                          ),
                          Container(
                              width: size.width * 0.78,
                              child: Textfield()
                                  .text(assimmediatelymsg3, TextStyles.mb16)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
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
    );
  }
}
