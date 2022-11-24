import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tyreshifter/Common/Profile.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Icon.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/string.dart';
import 'package:tyreshifter/provider/Changepassword_Ctrl.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../Widget/Texboxwidget.dart';
import '../config/TextStyles/Textstyles.dart';

class Change_password_Sccreen extends StatefulWidget {
  Change_password_Sccreen({Key? key}) : super(key: key);

  @override
  State<Change_password_Sccreen> createState() =>
      _Change_password_SccreenState();
}

class _Change_password_SccreenState extends State<Change_password_Sccreen> {
  Changepassword_Ctrl changepwdcrl = Get.put(Changepassword_Ctrl());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController old_pwd = TextEditingController();
    TextEditingController newpwd = TextEditingController();
    TextEditingController connewpwd = TextEditingController();

    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: change_Password),
      ),

      // Appbartext().appbar(change_Password,
      //     TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                  child: Image.asset(
                change_password_img,
                height: size.height * 0.25,
              )),
              SizedBox(height: 40),
              TextBoxwidget(
                hinttext: "Old Password",
                hintstyle:
                    TextStyles.withColor(TextStyles.mn14, color.textgrey_color),
                controller: changepwdcrl.old_password,
                border_color: color.border_grey_color,
                style: TextStyles.withColor(TextStyles.mn14, color.black),
                prefixshowicon: true,
                iconorimage: true,
                // ontap: () {
                //   // print("hii");
                //   // opendatepiker();
                //   setState(() {
                //     // address.text = "114, zoo chopati pawder USA";
                //   });
                // },
                readtype: false,
                showicon: false,
                imagepath: lock_icon,
              ),
              SizedBox(height: 15),

              TextBoxwidget(
                hinttext: "New Password",
                hintstyle:
                    TextStyles.withColor(TextStyles.mn14, color.textgrey_color),
                controller: changepwdcrl.new_password,
                border_color: color.border_grey_color,
                style: TextStyles.withColor(TextStyles.mn14, color.black),
                prefixshowicon: true,
                iconorimage: true,

                // ontap: () {
                //   // print("hii");
                //   // opendatepiker();
                //   setState(() {
                //     // address.text = "114, zoo chopati pawder USA";
                //   });
                // },

                readtype: false,
                showicon: false,
                imagepath: lock_icon,
              ),
              SizedBox(
                height: 15,
              ),
              TextBoxwidget(
                hinttext: "Confirm New Password",
                hintstyle:
                    TextStyles.withColor(TextStyles.mn14, color.textgrey_color),
                controller: changepwdcrl.confirm_new_password,
                border_color: color.border_grey_color,
                style: TextStyles.withColor(TextStyles.mn14, color.black),
                prefixshowicon: true,
                iconorimage: true,
                // ontap: () {
                //   // print("hii");
                //   // opendatepiker();
                //   setState(() {
                //     // address.text = "114, zoo chopati pawder USA";
                //   });
                // },
                readtype: false,
                showicon: false,
                imagepath: lock_icon,
              ),
              // textbox(email, "Old Password"),
              // SizedBox(
              //   height: 20,
              // ),
              // textbox(email, "New Paasword"),
              // SizedBox(
              //   height: 20,
              // ),
              // textbox(email, "Confirm New Password"),
              SizedBox(height: 50),
              SizedBox(
                width: size.width,
                child: ElevatedButtons(
                  name: update,
                  onTap: () {
                    if (changepwdcrl.old_password.text.isEmpty) {
                      Get.snackbar("Enter old password", "",
                          duration: Duration(seconds: 1));
                    } else if (changepwdcrl.new_password.text.isEmpty) {
                      Get.snackbar("Enter new password", "",
                          duration: Duration(seconds: 1));
                    } else if (changepwdcrl.confirm_new_password.text.isEmpty) {
                      Get.snackbar("Enter confirm new password", "",
                          duration: Duration(seconds: 1));
                    } else {
                      changepwdcrl.Change_password(context);

                      if (changepwdcrl.msg ==
                          "Your password has changed successfully") {
                        backScreen(context);
                      } else {
                        Get.snackbar(changepwdcrl.msg!, "");
                      }
                    }
                  },
                ),
              )
              // Padding(
              //   padding: const EdgeInsets.all(15),
              //   child: SizedBox(
              //     width: size.width,
              //     child: Elevatedbuttons().elevatedbutton(update, null, context),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  textbox(contrl, hint) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color.border_grey_color),
            borderRadius: BorderRadius.circular(15)),
        height: 55,
        width: size.width,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: contrl,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      lock_icon,
                    ),
                  ),
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 40, maxWidth: 40),
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyles.withColor(
                      TextStyles.mn14, color.textgrey_color)),
            )),
      ),
    );
  }
}
