import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tyreshifter/Customer/Immediately_Provider.dart';
import 'package:tyreshifter/Widget/Texboxwidget.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/provider/cartypecontroller.dart';
import '../Models/Cartype.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../Widget/Custome_Dialog.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import '../config/Color.dart';
import 'Assistance_immediately2.dart';

class Assistance_immediately3 extends StatefulWidget {
  final type;
  final servicetype;
  Assistance_immediately3({Key? key, this.type, this.servicetype})
      : super(key: key);

  @override
  State<Assistance_immediately3> createState() =>
      _Assistance_immediately3State();
}

class _Assistance_immediately3State extends State<Assistance_immediately3> {
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

  var checkedValue = true;

  @override
  void initState() {
    log("TYPEE" + widget.type.toString());
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
        backgroundColor: color.white,
        appBar: PreferredSize(
          preferredSize: Platform.isAndroid
              ? Size.fromHeight(appbarheight_android)
              : Size.fromHeight(appbarheight_ios),
          child: Appbartext(
            title: wellDimensionstxt,
          ),
        ),
        // Appbartext().appbar(
        //     widget.type == "1" ? tyreshift_immidiate : send_req,
        //     TextStyles.withColor(TextStyles.mb16, color.black),
        //     context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  searchfor,
                  style: TextStyles.withColor(
                      TextStyles.mb18, color.text_grey2_color),
                ).paddingSymmetric(horizontal: 5),
                SizedBox(
                  height: 20,
                ),
                TextBoxwidget(
                  keyboradtype: TextInputType.text,
                  hinttext: "Registration number",
                  hintstyle: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  controller: numbercar,
                  border_color: color.border_grey_color,
                  style: TextStyles.withColor(TextStyles.mb14, color.black),
                  ontap: () {
                    // print("hii");
                    // opendatepiker();
                    // setState(() {
                    //   date.text = DateFormat('dd/MM/yyyy')
                    //       .format(pickedDate!)
                    //       .toString();
                    // });
                  },
                  prefixshowicon: false,
                  readtype: false,
                  showicon: false,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButtons(
                  name: search,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => StatefulBuilder(
                                builder: (context, StateSetter setState) {
                              return Custom_dialog(
                                bgpopupcolor: color.popupbgcolor,
                                iconheight: 50.0,
                                title: edittxt,
                                showonebtn: true,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                checkedValue = !checkedValue;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                  width: 30,
                                                  child: Transform.scale(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    scale: 1.3,
                                                    child: Checkbox(
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        activeColor: color
                                                            .Primary_second_Color,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                        side:
                                                            MaterialStateBorderSide
                                                                .resolveWith(
                                                          (states) => BorderSide(
                                                              width: 1.0,
                                                              color: color
                                                                  .border_grey3_color),
                                                        ),
                                                        value: checkedValue,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            value = !value!;
                                                            checkedValue =
                                                                !checkedValue;
                                                          });
                                                        }),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  child: Textfield().text(
                                                    "255/35R19-Y-96",
                                                    TextStyles.withColor(
                                                        TextStyles.mb16,
                                                        color.txt_dark_color,
                                                        1.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 30),
                                          menu("Make", "AUDI"),
                                          SizedBox(height: 10),
                                          menu("Model",
                                              "TT S LINE SP EDITION TFSI"),
                                          SizedBox(height: 10),
                                          menu("Engine", "2.0"),
                                          SizedBox(height: 30),
                                          menu("Tyre sizes ", "1"),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                onbtnname: done,
                                ontaponebtn: () {
                                  widget.servicetype == tyreReplacement
                                      ? nextScreen(
                                          context,
                                          Assistance_immediately2(
                                              type: widget.type))
                                      : nextScreen(
                                          context,
                                          Immediately_Provider(
                                              type: widget.type));
                                },
                              );
                            }));
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Textfield().image("asset", "assets/or.png"),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: color.border_grey_color, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Textfield().text(
                        tyreProfile,
                        TextStyles.withColor(
                            TextStyles.mn16, color.textgrey_color, 1.0),
                      ),
                      SvgPicture.string(
                        arrowdown1_iconsvg,
                        // height: 6,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: color.border_grey_color, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Textfield().text(
                        wheeldiameterlabel,
                        TextStyles.withColor(
                            TextStyles.mn16, color.textgrey_color, 1.0),
                      ),
                      SvgPicture.string(
                        arrowdown1_iconsvg,
                        // height: 6,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: color.border_grey_color, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Textfield().text(
                        tyrewidthlabel,
                        TextStyles.withColor(
                            TextStyles.mn16, color.textgrey_color, 1.0),
                      ),
                      SvgPicture.string(
                        arrowdown1_iconsvg,
                        // height: 6,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: color.border_grey_color, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Textfield().text(
                        speedratinglabel,
                        TextStyles.withColor(
                            TextStyles.mn16, color.textgrey_color, 1.0),
                      ),
                      SvgPicture.string(
                        arrowdown1_iconsvg,
                        // height: 6,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButtons(
                  name: search,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => StatefulBuilder(
                                builder: (context, StateSetter setState) {
                              return Custom_dialog(
                                iconheight: 50.0,
                                title: edittxt,
                                showonebtn: true,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                                width: 30,
                                                child: Transform.scale(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  scale: 1.3,
                                                  child: Checkbox(
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      activeColor: color
                                                          .Primary_second_Color,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      side:
                                                          MaterialStateBorderSide
                                                              .resolveWith(
                                                        (states) => BorderSide(
                                                            width: 1.0,
                                                            color: color
                                                                .border_grey3_color),
                                                      ),
                                                      value: checkedValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          value = !value!;
                                                          checkedValue =
                                                              !checkedValue;
                                                        });
                                                      }),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                child: Textfield().text(
                                                  "255/35R19-Y-96",
                                                  TextStyles.withColor(
                                                      TextStyles.mb16,
                                                      color.txt_dark_color,
                                                      1.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30),
                                          menu("Make", "AUDI"),
                                          SizedBox(height: 10),
                                          menu("Model",
                                              "TT S LINE SP EDITION TFSI"),
                                          SizedBox(height: 10),
                                          menu("Engine", "2.0"),
                                          SizedBox(height: 30),
                                          menu("Tyre sizes", ": 1"),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                onbtnname: done,
                                ontaponebtn: () {
                                  widget.servicetype == tyreReplacement
                                      ? nextScreen(
                                          context,
                                          Assistance_immediately2(
                                              type: widget.type))
                                      : nextScreen(
                                          context,
                                          Immediately_Provider(
                                              type: widget.type));
                                },
                              );
                            }));
                  },
                ),
              ],
            ),
          ),
        ));
  }

  menu(menuname, menuanswer) {
    return Row(children: [
      Container(
        child: Textfield().text(
          menuname + ": ",
          TextStyles.withColor(TextStyles.mb16, color.txt_dark_color, 1.0),
        ),
      ),
      Container(
        child: Textfield().text(
          menuanswer,
          TextStyles.withColor(TextStyles.mn16, color.txt_dark_color, 1.0),
        ),
      )
    ]);
  }
}
