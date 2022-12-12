import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tyreshifter/Customer/Assistance_immediately.dart';
import 'package:tyreshifter/Customer/Assistance_immediately3.dart';
import 'package:tyreshifter/Customer/ProductList.dart';
import 'package:tyreshifter/Customer/Products.dart';
import 'package:tyreshifter/Widget/Texboxwidget.dart';

import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/getx/controller.dart';
import 'package:tyreshifter/provider/cartypecontroller.dart';
import '../Models/Cartype.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../Widget/Dropdown.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import '../config/Color.dart';

class AddProducts extends StatefulWidget {
  AddProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  var _chosenValue_cat = "Battery";
  var _chosenValue_budget = "Budget";
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  List categorylist = ["Category", "Oil", "Tyres"];
  List budgetlist = ["Budget", "Mid-Range", "Premium"];
  DataController dcx = Get.put(DataController());
  List vehicle_type = [];
  List vehicle_type_id = [];

  DateTime? pickedDate = DateTime.now();
  TextEditingController numbercar = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController tyreneed = TextEditingController();

  final Cartypecontroller getxcartypecontroller = Get.put(Cartypecontroller());

  Cartype? cartypemodel;

  @override
  void initState() {
    getxcartypecontroller.getcartype(context);

    super.initState();
  }

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        dcx.Hmscard_img = imagefiles!;
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file." + e.toString());
    }
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
            title: addproduct,
          ),
        ),
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
                Dropdown(
                  dropdowncolor: Colors.transparent,
                  borderradius: 15,
                  width: size.width,
                  hinttxt: category,
                  style: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  list: categorylist,
                  current_value: _chosenValue_cat,
                  Textalignment: AlignmentDirectional.centerStart,
                  border_color: color.border_grey4_color,
                  height: 52,
                ),
                SizedBox(
                  height: 20,
                ),
                Dropdown(
                  dropdowncolor: Colors.transparent,
                  borderradius: 15,
                  width: size.width,
                  hinttxt: budget,
                  style: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  list: budgetlist,
                  current_value: _chosenValue_budget,
                  Textalignment: AlignmentDirectional.centerStart,
                  border_color: color.border_grey4_color,
                  height: 52,
                ),
                SizedBox(
                  height: 20,
                ),
                TextBoxwidget(
                  keyboradtype: TextInputType.number,
                  hinttext: productname,
                  hintstyle: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  controller: numbercar,
                  border_color: color.border_grey_color,
                  style: TextStyles.withColor(TextStyles.mb14, color.black),
                  ontap: () {},
                  prefixshowicon: false,
                  readtype: false,
                  showicon: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextBoxwidget(
                  keyboradtype: TextInputType.number,
                  hinttext: price,
                  hintstyle: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  controller: numbercar,
                  border_color: color.border_grey_color,
                  style: TextStyles.withColor(TextStyles.mb14, color.black),
                  ontap: () {},
                  prefixshowicon: false,
                  readtype: false,
                  showicon: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // width: size.width,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.18,
                        decoration: BoxDecoration(
                            border: Border.all(color: color.border_grey_color),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2.0),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              //only numeric keyboard.
                              // LengthLimitingTextInputFormatter(10), //only 6 digit
                            ],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: qty,
                                hintStyle: TextStyles.withColor(
                                    TextStyles.mn14, color.textgrey_color)),
                            onChanged: (value) {
                              print(value);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextBoxwidget(
                          keyboradtype: TextInputType.number,
                          hinttext: brand_nametxt,
                          hintstyle: TextStyles.withColor(
                              TextStyles.mn14, color.textgrey_color),
                          controller: numbercar,
                          border_color: color.border_grey_color,
                          style: TextStyles.withColor(
                              TextStyles.mb14, color.black),
                          ontap: () {},
                          prefixshowicon: false,
                          readtype: false,
                          showicon: false,
                        ).paddingOnly(left: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextBoxwidget(
                  keyboradtype: TextInputType.number,
                  hinttext: stocknum,
                  hintstyle: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  controller: numbercar,
                  border_color: color.border_grey_color,
                  style: TextStyles.withColor(TextStyles.mb14, color.black),
                  ontap: () {},
                  prefixshowicon: false,
                  readtype: false,
                  showicon: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextBoxwidget(
                          keyboradtype: TextInputType.number,
                          hinttext: tyrewidthlabel,
                          hintstyle: TextStyles.withColor(
                              TextStyles.mn14, color.textgrey_color),
                          controller: numbercar,
                          border_color: color.border_grey_color,
                          style: TextStyles.withColor(
                              TextStyles.mb14, color.black),
                          ontap: () {},
                          prefixshowicon: false,
                          readtype: false,
                          showicon: false,
                        ).paddingOnly(right: 10),
                      ),
                      Expanded(
                        child: TextBoxwidget(
                          keyboradtype: TextInputType.number,
                          hinttext: tyreprofilelabel,
                          hintstyle: TextStyles.withColor(
                              TextStyles.mn14, color.textgrey_color),
                          controller: numbercar,
                          border_color: color.border_grey_color,
                          style: TextStyles.withColor(
                              TextStyles.mb14, color.black),
                          ontap: () {},
                          prefixshowicon: false,
                          readtype: false,
                          showicon: false,
                        ).paddingOnly(left: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextBoxwidget(
                  keyboradtype: TextInputType.number,
                  hinttext: wheeldiameterlabel,
                  hintstyle: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  controller: tyreneed,
                  border_color: color.border_grey_color,
                  style: TextStyles.withColor(TextStyles.mb14, color.black),
                  ontap: () {},
                  prefixshowicon: false,
                  readtype: false,
                  showicon: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextBoxwidget(
                  keyboradtype: TextInputType.number,
                  hinttext: speedratinglabel,
                  hintstyle: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  controller: tyreneed,
                  border_color: color.border_grey_color,
                  style: TextStyles.withColor(TextStyles.mb14, color.black),
                  ontap: () {},
                  prefixshowicon: false,
                  readtype: false,
                  showicon: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextBoxwidget(
                  keyboradtype: TextInputType.number,
                  hinttext: loadIndexlabel,
                  hintstyle: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color),
                  controller: tyreneed,
                  border_color: color.border_grey_color,
                  style: TextStyles.withColor(TextStyles.mb14, color.black),
                  ontap: () {},
                  prefixshowicon: false,
                  readtype: false,
                  showicon: false,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Textfield().text(product_image_txt,
                        TextStyles.withColor(TextStyles.mb16, color.black)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              openImages();
                            },
                            child: SvgPicture.string(upload_iconsvg)),
                        imagefiles != null
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  children: imagefiles!.map((imageone) {
                                    return Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              child: Image.file(
                                                File(imageone.path),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          removeimg,
                                          height: 15,
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButtons(
                  name: done,
                  onTap: () {
                    // Products();
                  },
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ));
  }
}
