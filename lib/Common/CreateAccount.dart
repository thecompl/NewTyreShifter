import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Gesture.dart';
import '../Widget/Textfield.dart';
import '../config/Color.dart';
import '../config/string.dart';
import '../getx/controller.dart';
import 'Login.dart';
import 'Otp.dart';

class Create_Account extends StatefulWidget {
  @override
  _Create_AccountState createState() => _Create_AccountState();
}

class _Create_AccountState extends State<Create_Account> {
  var checkedValue = false;
  // TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  // TextEditingController password = TextEditingController();
  // TextEditingController con_password = TextEditingController();
  // TextEditingController company_number = TextEditingController();
  // TextEditingController company_name = TextEditingController();
  // TextEditingController birthday = TextEditingController();
  // TextEditingController about_us = TextEditingController();
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  int active = 0;
  String account_type = company;
  String? type_account;
  String? type;
  final key = GlobalKey();
  DataController dcx = Get.put(DataController());

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
  void initState() {
    type = GetStorage().read("type");
    if (type == get_shifter) {
      dcx.roleid = 4;
    } else {
      dcx.roleid = 3;
    }

    get_typeaccount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize:
            Platform.isAndroid ? Size.fromHeight(40) : Size.fromHeight(40 + 10),
        child: Appbartext(
          showboxshadow: false,
          title: '',
          elevation: 0.0,
        ),
      ),

      // Appbartext().appbar(
      //     '',
      //     TextStyles.withColor(TextStyles.mb16, color.black),
      //     context,
      //     0,0,'',0.0),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.cyan)
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Textfield().text(create_account, TextStyles.mb24),
                SizedBox(
                  height: 5,
                ),

                Textfield().text(
                    sign_up_to_accmsg,
                    TextStyles.withColor(
                        TextStyles.mn14, color.textgrey_color)),
                SizedBox(
                  height: 20,
                ),
                type_account == become_shifter
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textfield().text(
                              Register_as,
                              TextStyles.withColor(
                                  TextStyles.mb16, color.txt_dark_blue_color)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  dcx.accounttype = 1;
                                  setState(() {
                                    account_type = company;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      child: Radio(
                                          value: company,
                                          groupValue: account_type,
                                          onChanged: (value) {
                                            setState(() {
                                              account_type = value.toString();
                                              print("fe =>" + value.toString());
                                            });
                                          }),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Textfield().text(
                                      company,
                                      TextStyles.withColor(TextStyles.mb14,
                                          color.txt_dark_blue_color, 1.2),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  dcx.accounttype = 2;
                                  setState(() {
                                    account_type = individual;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      child: Radio(
                                          value: individual,
                                          groupValue: account_type,
                                          onChanged: (value) {
                                            setState(() {
                                              account_type = value.toString();
                                              print("fe =>" + value.toString());
                                            });
                                          }),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Textfield().text(
                                      individual,
                                      TextStyles.withColor(
                                          TextStyles.mb14, color.black, 1.2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Textfieldwithicon(name, TextInputType.text,
                        enterfull_name_txt, perosnimg, false, 0),

                type_account == become_shifter
                    ? Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Textfieldwithicon(
                              dcx.Company_name,
                              TextInputType.text,
                              enter_company_nametxt,
                              perosnimg,
                              false,
                              0),
                          SizedBox(
                            height: 15,
                          ),
                          Textfieldwithicon(
                              dcx.company_number,
                              TextInputType.number,
                              enter_company_numbertxt,
                              company_no_icon,
                              false,
                              1)
                        ],
                      )
                    : Container(),

                SizedBox(
                  height: 15,
                ),
                Textfieldwithicon(dcx.email, TextInputType.emailAddress,
                    enter_emailtxt, mail_icon, false, 2),
                // GestureDetector(
                //   onTap: () {},
                //   child: Padding(
                //     padding: const EdgeInsets.all(5),
                //     child: Container(
                //       decoration: BoxDecoration(
                //           border: Border.all(color: color.border_grey_color),
                //           borderRadius: BorderRadius.circular(15)),
                //       // height: size.height * 0.065,
                //       width: size.width,
                //       child: Padding(
                //           padding: EdgeInsets.all(10),
                //           child: TextField(
                //             keyboardType: TextInputType.emailAddress,
                //             controller: email,
                //             decoration: InputDecoration(
                //                 prefixIcon: Padding(
                //                   padding: const EdgeInsets.only(right: 10),
                //                   child: Image.asset(
                //                     mail_icon,
                //                   ),
                //                 ),
                //                 prefixIconConstraints:
                //                     BoxConstraints(maxHeight: 35, maxWidth: 35),
                //                 border: InputBorder.none,
                //                 hintText: "Enter Email here",
                //                 hintStyle: TextStyles.withColor(
                //                     TextStyles.mn14, color.textgrey_color)),
                //           )),
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 15,
                ),

                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: color.border_grey_color),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Container(
                        child: CountryPickerDropdown(
                          icon: Image.asset(
                            vertical,
                            height: size.height * 0.05,
                          ),
                          initialValue: 'in',
                          itemBuilder: _buildDropdownItem,
                          onValuePicked: (Country country) {
                            var code = country.phoneCode;
                            setState(() {
                              dcx.countrycode = "+" + code;
                            });

                            print("${country.phoneCode}");
                          },
                        ),
                      ),
                      Container(
                        width: size.width * 0.55,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextField(
                            controller: dcx.phone_no,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              //only numeric keyboard.
                              LengthLimitingTextInputFormatter(
                                  10), //only 6 digit
                            ],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Phone Number",
                                hintStyle: TextStyles.withColor(
                                    TextStyles.mn14, color.textgrey_color)),
                            onChanged: (value) {
                              print(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Textfieldwithicon(dcx.birthday, TextInputType.phone,
                    enter_birthday_txt, birthdayimg, false, 3),

                SizedBox(
                  height: 15,
                ),
                // Textfield().textbox('Password', Icons.lock, true),
                Textfieldwithicon(dcx.password, TextInputType.text,
                    password_txt, lock_icon, true, 4),
                SizedBox(
                  height: 15,
                ),
                Textfieldwithicon(dcx.confirm_password, TextInputType.text,
                    con_password_txt, lock_icon, true, 4),

                type_account == become_shifter
                    ? Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: color.border_grey_color),
                                  borderRadius: BorderRadius.circular(15)),
                              // height: size.height * 0.2,
                              width: size.width * 0.9,
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextField(
                                    maxLines: 5,
                                    keyboardType: TextInputType.text,
                                    controller: dcx.aboutUs,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: about_us_txt,
                                        hintStyle: TextStyles.mn14),
                                  )),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(height: 10),
                // SizedBox(
                //   height: 15,
                // ),
                // type_account == become_shifter
                //     ? Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Textfield().text(upload_hms_card, TextStyles.mb14),
                //           SizedBox(
                //             height: 10,
                //           ),
                //           Row(
                //             children: [
                //               GestureDetector(
                //                   onTap: () {
                //                     openImages();
                //                   },
                //                   child: SvgPicture.string(upload_iconsvg)),
                //               imagefiles != null
                //                   ? SingleChildScrollView(
                //                       scrollDirection: Axis.horizontal,
                //                       child: Wrap(
                //                         children: imagefiles!.map((imageone) {
                //                           return Stack(
                //                             alignment: Alignment.topRight,
                //                             children: [
                //                               Padding(
                //                                 padding:
                //                                     const EdgeInsets.all(8.0),
                //                                 child: ClipRRect(
                //                                   borderRadius:
                //                                       BorderRadius.circular(10),
                //                                   child: Container(
                //                                     height: 60,
                //                                     width: 60,
                //                                     child: Image.file(
                //                                       File(imageone.path),
                //                                       fit: BoxFit.fill,
                //                                     ),
                //                                   ),
                //                                 ),
                //                               ),
                //                               Image.asset(
                //                                 removeimg,
                //                                 height: 15,
                //                               ),
                //                             ],
                //                           );
                //                         }).toList(),
                //                       ),
                //                     )
                //                   : Container(),
                //             ],
                //           ),
                //         ],
                //       )
                //     : Container(),
                type_account == become_shifter
                    ? SizedBox(
                        height: 10,
                      )
                    : Container(),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      // decoration:
                      //     BoxDecoration(border: Border.all(color: color.black)),
                      child: Checkbox(
                          activeColor: color.Primary_second_Color,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                                width: 1.0, color: color.border_grey3_color),
                          ),
                          value: checkedValue,
                          onChanged: (value) {
                            setState(() {
                              value = !value!;
                              checkedValue = !checkedValue;
                            });
                          }),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: size.width * 0.7,
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.black)
                      // ),
                      child: Text.rich(
                          // textAlign: TextAlign.center,
                          TextSpan(
                              style: TextStyles.withColor(
                                  TextStyles.mn14, color.black),
                              text: i_agreetxt,
                              children: <InlineSpan>[
                            TextSpan(
                              text: terms_condition,
                              style: TextStyles.withColor(
                                  TextStyles.mn14, color.Primary_second_Color),
                            )
                          ])),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButtons(
                  name: register,
                  onTap: () {
                    dcx.registe_user(context);
                    if (dcx.errormsg == null) {
                      nextScreen(context, Otp());
                    } else {
                      Get.snackbar(
                          dcx.errormsg.toString(), dcx.errormsg.toString());
                    }
                  },
                ),
                SizedBox(height: 20),

                type_account == get_shifter
                    ? Column(
                        children: [
                          Textfield().image("asset", "assets/or.png"),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width * 0.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset(
                                  "assets/google.png",
                                  height: 50,
                                ),
                                Image.asset(
                                  "assets/apple.png",
                                  height: 50,
                                ),
                                Image.asset(
                                  "assets/fb.png",
                                  height: 50,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    : Container(),

                // Spacer(),
                GestureDetector(
                  onTap: () {
                    nextScreen(context, Login());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Textfield().text(
                          "Already have an account? ",
                          TextStyles.withColor(
                            TextStyles.mn16,
                            color.textgrey_color,
                          ),
                          TextAlign.center),
                      Textfield().text(
                          "Log in",
                          TextStyles.withColor(TextStyles.mb16, color.black),
                          TextAlign.center),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Textfieldwithicon(contrl, keyboratype, hinttxt, icon, suffixicon, index) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        print(index);
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color.border_grey_color),
            borderRadius: BorderRadius.circular(15)),
        // height: size.height * 0.065,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
            keyboardType: keyboratype,
            controller: contrl,
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    icon,
                  ),
                ),
                suffixIcon: suffixicon
                    ? Icon(
                        Icons.remove_red_eye_outlined,
                        color: color.Primary_second_Color,
                        size: 25,
                      )
                    : null,
                prefixIconConstraints:
                    BoxConstraints(maxHeight: 30, maxWidth: 30),
                border: InputBorder.none,
                hintText: hinttxt,
                hintStyle: TextStyles.withColor(
                    TextStyles.mn14, color.textgrey_color)),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            Container(
                width: 80,
                child: Row(
                  children: [
                    CountryPickerUtils.getDefaultFlagImage(country),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      width: 40,
                      child: Text(
                        "+${country.phoneCode}",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )),
            Icon(Icons.keyboard_arrow_down_sharp)
          ],
        ),
      );

  get_typeaccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type_account = prefs.getString("type");
    });

    print("type" + type_account.toString());
  }
}
