import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/Suppliers/AddVehicle.dart';
import 'package:tyreshifter/Widget/Appbartext.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/EmployeeListwidget.dart';
import 'package:tyreshifter/Widget/MyShiftwidget.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/config/string.dart';

import '../Widget/Textfield.dart';

class MyShift extends StatefulWidget {
  const MyShift({Key? key}) : super(key: key);

  @override
  State<MyShift> createState() => _MyShiftState();
}

class _MyShiftState extends State<MyShift> {
  bool focus = false;
  var checkedValue = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: myshift, show_arrow_icon: 0),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView.builder(
                // scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return MyShiftwidget(
                    title: '08/29/2022',
                    child1: SvgPicture.asset(calendaroutline),
                    child2: Icon(
                      Icons.access_time_rounded,
                      size: 24,
                      color: color.Primary_second_Color,
                    ),
                    child3: Icon(
                      Icons.access_time_rounded,
                      size: 24,
                      color: color.Primary_second_Color,
                    ),
                    label1: starttime,
                    label2: endtime,
                    value1: '11:00 AM',
                    value2: '01:05 PM',
                  );
                }),
          ),
        ),
      ),
    );
  }
}
