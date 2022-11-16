import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:tyreshifter/Suppliers/Set_Availability.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Textfield.dart';
import '../config/string.dart';
import '../provider/Pricetypectrl.dart';

class SetPrice extends StatefulWidget {
  final String? type;
  SetPrice({Key? key, this.type}) : super(key: key);

  @override
  State<SetPrice> createState() => _SetPriceState();
}

class _SetPriceState extends State<SetPrice> {
  RangeValues _currentRangeValuessuv = const RangeValues(0, 100);
  RangeValues _currentRangeValuesnormal = const RangeValues(0, 100);
  Pricetypectrl pricetypectrl = Get.put(Pricetypectrl());
  static String _valueToString(double value) {
    return value.toStringAsFixed(0);
  }

  @override
  void initState() {
    pricetypectrl.pricetype(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(
          title: widget.type == "0" ? setup_price : edit_price,
          show_arrow_icon: widget.type == "0" ? 1 : 0,
        ),
      ),

      // Appbartext().appbar(
      //     widget.type == "0" ? setup_price : edit_price,
      //     TextStyles.withColor(TextStyles.mb16, color.black),
      //     context,1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            setprice_card1("SUV  price (incl.VAT)"),
            SizedBox(height: 15),
            setprice_card2("Normal cars (incl. VAT)"),
            SizedBox(height: 15),
            immidiate_card("Immediate tyreshift"),
            Spacer(),
            ElevatedButtons(
              name: widget.type == "0" ? done : update,
              onTap: () {
                nextScreen(context, Set_Availability(type: "0"));
              },
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  setprice_card1(txt) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textfield().text(txt, TextStyles.mb16),
            Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),

                // height: 100,
                // width: 3000,
                child: SliderTheme(
                  data: SliderThemeData(
                      trackHeight: 1,
                      activeTrackColor: color.border_grey_color,
                      overlayShape: SliderComponentShape.noOverlay,
                      inactiveTrackColor: color.border_grey_color,
                      thumbColor: color.Primary_second_Color,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 20)),
                  child: RangeSlider(
                    values: _currentRangeValuessuv,
                    min: 0,
                    max: 100,
                    // divisions: 10,
                    labels: RangeLabels(
                      _currentRangeValuessuv.start.round().toString(),
                      _currentRangeValuessuv.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValuessuv = values;
                      });
                    },
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: color.border_grey_color)),
                  child: Textfield().text(
                      "kr" + _currentRangeValuessuv.start.round().toString(),
                      TextStyles.withColor(
                          TextStyles.mb14, color.txt_dark_color),
                      TextAlign.center),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: color.border_grey_color)),
                  child: Textfield().text(
                      "kr" + _currentRangeValuessuv.end.round().toString(),
                      TextStyles.withColor(
                          TextStyles.mb14, color.txt_dark_color),
                      TextAlign.center),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  setprice_card2(txt) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textfield().text(txt, TextStyles.mb16),
            Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: SliderTheme(
                  data: SliderThemeData(
                      trackHeight: 1,
                      overlayShape: SliderComponentShape.noOverlay,
                      activeTrackColor: color.border_grey_color,
                      inactiveTrackColor: color.border_grey_color,
                      thumbColor: color.Primary_second_Color,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 20)),
                  child: Container(
                    // width: double.infinity,
                    child: RangeSlider(
                      values: _currentRangeValuesnormal,
                      min: 0,
                      max: 300,
                      // divisions: 10,
                      labels: RangeLabels(
                        _currentRangeValuesnormal.start.round().toString(),
                        _currentRangeValuesnormal.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValuesnormal = values;
                        });
                      },
                    ),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: color.border_grey_color)),
                  child: Textfield().text(
                      "kr" + _currentRangeValuesnormal.start.round().toString(),
                      TextStyles.withColor(
                          TextStyles.mb14, color.txt_dark_color),
                      TextAlign.center),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: color.border_grey_color)),
                  child: Textfield().text(
                      "kr" + _currentRangeValuesnormal.end.round().toString(),
                      TextStyles.withColor(
                          TextStyles.mb14, color.txt_dark_color),
                      TextAlign.center),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  immidiate_card(txt) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 110,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Textfield().text(txt, TextStyles.mb16),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Textfield().text(
                    "kr542",
                    TextStyles.withColor(TextStyles.mb24, color.black),
                    TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
