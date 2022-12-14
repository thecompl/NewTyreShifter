import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/Common/Enable_location.dart';
import 'package:tyreshifter/Widget/Appbartext.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/config/string.dart';

import '../Widget/Textfield.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  bool focus = false;
  var checkedValue = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: addvehicle, show_arrow_icon: 0),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * .9,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: color.border_grey6_color)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                carbon_svg,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: color.Primary_second_Color),
                              borderRadius: BorderRadius.circular(15)),
                          // height: size.height * 0.065,
                          width: size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              // controller: getxlogincontroller.username,
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: SvgPicture.asset(
                                      hassicon,
                                    ),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                      maxHeight: 30, maxWidth: 30),
                                  border: InputBorder.none,
                                  hintText: "Registration number",
                                  hintStyle: TextStyles.withColor(
                                      TextStyles.mn14, color.textgrey_color)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          SvgPicture.asset(addicon_svg),
                          SizedBox(
                            width: 5,
                          ),
                          Textfield().text(addanothervehicle, TextStyles.mn16),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButtons(
                      name: done,
                      onTap: () {
                        // nextScreen(context, AddEmployee());
                        nextScreen(context, Enable_location());
                      },
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
