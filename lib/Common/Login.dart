import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyreshifter/Common/Enable_location.dart';
import 'package:tyreshifter/Common/Forgetpassword.dart';

import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/provider/LoginController.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Gesture.dart';
import '../Widget/Textfield.dart';
import '../config/Color.dart';
import '../config/string.dart';
import '../getx/controller.dart';

import 'CreateAccount.dart';
import 'Otp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? type_account = become_shifter;
  final LoginController getxlogincontroller = Get.put(LoginController());
  bool focus = false;
  String? type;
  @override
  void initState() {
    type = GetStorage().read("type");
    if (type == get_shifter) {
      getxlogincontroller.roleid = 4;
    } else {
      getxlogincontroller.roleid = 3;
    }

    get_typeaccount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // get_typeaccount();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(
          showboxshadow: false,
          title: '',
          elevation: 0.0,
          show_arrow_icon: 1,
        ),
      ),
      // Appbartext().appbar(
      //   '',
      //   TextStyles.withColor(TextStyles.mb16, color.black),
      //   context,
      //   1,0,'',0.0),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: getxlogincontroller.showloading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 30),
                  type_account == become_shifter
                      ? Textfield().text(hii_welcome_back, TextStyles.mb24)
                      : Textfield().text(hii_welcome, TextStyles.mb24),
                  SizedBox(
                    height: 10,
                  ),
                  Textfield().text(
                      login_account_msg,
                      TextStyles.withColor(
                          TextStyles.mn14, color.textgrey_color)),
                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: focus
                                ? color.Primary_second_Color
                                : color.border_grey_color),
                        borderRadius: BorderRadius.circular(15)),
                    // height: size.height * 0.065,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: getxlogincontroller.username,
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image.asset(
                                mail_icon,
                              ),
                            ),
                            prefixIconConstraints:
                                BoxConstraints(maxHeight: 30, maxWidth: 30),
                            border: InputBorder.none,
                            hintText: "Enter Email here",
                            hintStyle: TextStyles.withColor(
                                TextStyles.mn14, color.textgrey_color)),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: color.border_grey_color),
                          borderRadius: BorderRadius.circular(15)),
                      // height: size.height * 0.07,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: getxlogincontroller.password,
                          obscureText: true,
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: color.Primary_second_Color,
                                size: 25,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  lock_icon,
                                ),
                              ),
                              prefixIconConstraints:
                                  BoxConstraints(maxHeight: 30, maxWidth: 30),
                              border: InputBorder.none,
                              hintText: "Enter password here",
                              hintStyle: TextStyles.withColor(
                                  TextStyles.mn14, color.textgrey_color)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Textfield().textbox('Password', Icons.lock, true),
                  GestureDetector(
                    onTap: () {
                      nextScreen(context, Forget_password());
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Textfield().text(forgotpassword, TextStyles.mb18)
                        ]),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButtons(
                      name: login,
                      onTap: () {
                        if (getxlogincontroller.username.text.isNotEmpty &&
                            getxlogincontroller.password.text.isNotEmpty) {
                          getxlogincontroller.login_user(context);
                        } else {
                          Get.snackbar("Username OR email is Required", "");
                        }
                      }),

                  SizedBox(
                    height: 25,
                  ),

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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                            // SizedBox(height: 20),
                          ],
                        )
                      : Container(),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        // print("hii");
                        nextScreen(context, Create_Account());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Textfield().text(
                                "Don’t have an account? ",
                                TextStyles.withColor(
                                  TextStyles.mn16,
                                  color.textgrey_color,
                                ),
                                TextAlign.center),
                            Textfield().text(
                                "Sign up",
                                TextStyles.withColor(
                                    TextStyles.mb16, color.black),
                                TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
    );
  }

  get_typeaccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type_account = prefs.getString("type");
    });
    print("type account--" + type_account.toString());
  }
}
