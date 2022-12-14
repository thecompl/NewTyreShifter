import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/Suppliers/AddVehicle.dart';
import 'package:tyreshifter/Suppliers/MyShift.dart';
import 'package:tyreshifter/Widget/Appbartext.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/EmployeeListwidget.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/config/string.dart';

import '../Customer/Dialogs/Delete_dialog.dart';
import '../Widget/Custome_Dialog.dart';
import '../Widget/Textfield.dart';
import 'Dailogs/CancelBookingdailog.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
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
        child: Appbartext(title: employee, show_arrow_icon: 0),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView.builder(
                // scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: EmployeeListwidget(
                      title: 'Jane Cooper',
                      email: 'Janeooper123@gmail.com',
                      subtitle: 'Gj01 pu6756',
                      label1: starttime,
                      label2: endtime,
                      value1: '11:00 AM',
                      value2: '01:05 PM',
                      ontapdelete: () {
                        showDialog(
                            context: context,
                            builder: (context) => Custom_dialog(
                                  iconheight: 50.0,
                                  title: edittxt,
                                  showchild: true,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 35),
                                      SvgPicture.string(
                                        deletesvg,
                                        height: 50,
                                      ),
                                      SizedBox(height: 20),
                                      Textfield().text(
                                          deletetxt,
                                          TextStyles.withColor(TextStyles.mb20,
                                              color.text_grey2_color)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Textfield().text(
                                          deletepopmsg,
                                          TextStyles.withColor(TextStyles.mn18,
                                              color.text_grey2_color)),
                                      SizedBox(
                                        height: 40,
                                      )
                                    ],
                                  ),
                                  cancellabel: no,
                                  confirmlabel: yes,
                                  Oncanceltap: () {
                                    backScreen(context);
                                  },
                                  Onconfirmtap: () {
                                    backScreen(context);
                                  },
                                ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (() {
                            showDialog(
                                context: context,
                                builder: (context) => Custom_dialog(
                                      iconheight: 50.0,
                                      title: edittxt,
                                      showchild: true,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 35),
                                          SvgPicture.string(
                                            exiticonsvgstring,
                                            height: 50,
                                          ),
                                          SizedBox(height: 20),
                                          Textfield().text(
                                              log_out,
                                              TextStyles.withColor(
                                                  TextStyles.mb20,
                                                  color.text_grey2_color)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Textfield().text(
                                              log_outmsg,
                                              TextStyles.withColor(
                                                  TextStyles.mn18,
                                                  color.text_grey2_color)),
                                          SizedBox(
                                            height: 40,
                                          )
                                        ],
                                      ),
                                      cancellabel: no,
                                      confirmlabel: yes,
                                      Oncanceltap: () {
                                        backScreen(context);
                                      },
                                      Onconfirmtap: () {
                                        backScreen(context);
                                      },
                                    ));

                            // nextScreen(context, MyShift());
                          }),
                          child: SvgPicture.asset(exiticon),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
