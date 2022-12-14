import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/Suppliers/AddVehicle.dart';
import 'package:tyreshifter/Suppliers/Dailogs/Quantitydailog.dart';
import 'package:tyreshifter/Widget/Appbartext.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/config/string.dart';
import '../Widget/Textfield.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  bool focus = false;
  var checkedValue = false;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () => show_dialog(context));

    super.initState();
  }

  void ShowVehicalDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Quantitydailog(
              iconsvg: info_iconsvg,
              showicon: true,
              showquantity: false,
              showtitle: false,
              msg: employeemsg,
              confirmlabel: okay,
              Onconfirmtap: () {
                backScreen(context);
                nextScreen(context, AddVehicle());
              },
            ));
  }

  show_dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Quantitydailog(
              iconsvg: info_iconsvg,
              showicon: true,
              showquantity: false,
              showtitle: false,
              msg: employeemsg,
              confirmlabel: okay,
              Onconfirmtap: () {
                backScreen(context);
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // show_dialog(context);

    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: addEmployee, show_arrow_icon: 0),
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
                        SizedBox(height: 10),
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
                              keyboardType: TextInputType.streetAddress,
                              // controller: getxlogincontroller.username,
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      perosnimg,
                                    ),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                      maxHeight: 30, maxWidth: 30),
                                  border: InputBorder.none,
                                  hintText: "Employee name",
                                  hintStyle: TextStyles.withColor(
                                      TextStyles.mn14, color.textgrey_color)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                              keyboardType: TextInputType.emailAddress,
                              // controller: getxlogincontroller.username,
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      mail_icon,
                                    ),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                      maxHeight: 30, maxWidth: 30),
                                  border: InputBorder.none,
                                  hintText: "Enter Email here",
                                  hintStyle: TextStyles.withColor(
                                      TextStyles.mn14, color.textgrey_color)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              checkedValue = !checkedValue;
                            });
                          }),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 30,
                                child: Transform.scale(
                                  alignment: Alignment.centerRight,
                                  scale: 1.3,
                                  child: Checkbox(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      activeColor: color.Primary_second_Color,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => BorderSide(
                                            width: 1.0,
                                            color: color.border_grey3_color),
                                      ),
                                      value: checkedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          value = !value!;
                                          checkedValue = !checkedValue;
                                        });
                                      }),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: size.width * 0.7,
                                child: Text.rich(
                                    // textAlign: TextAlign.center,
                                    TextSpan(
                                        style: TextStyles.withColor(
                                            TextStyles.mn14,
                                            color.textgrey_color),
                                        text: i_agreetxt2,
                                        children: <InlineSpan>[
                                      TextSpan(
                                        text: learnmore,
                                        style: TextStyles.withColor(
                                            TextStyles.mn14,
                                            color.Primary_second_Color),
                                      )
                                    ])),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10)
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // nextScreen(context, AddVehicle());
                        // nextScreen(context, Enable_location());
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(addicon_svg),
                          SizedBox(
                            width: 5,
                          ),
                          Textfield().text(addanotheremployee, TextStyles.mn16),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButtons(
                      name: done,
                      onTap: () {
                        ShowVehicalDialog(context);
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
