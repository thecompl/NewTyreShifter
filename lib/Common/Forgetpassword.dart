import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tyreshifter/Common/Login.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/provider/ForgetpasswordController.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../Widget/Textfield.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';

class Forget_password extends StatefulWidget {
  const Forget_password({Key? key}) : super(key: key);

  @override
  State<Forget_password> createState() => _Forget_passwordState();
}

class _Forget_passwordState extends State<Forget_password> {
  TextEditingController email = TextEditingController();
  final ForgetpasswordController forgetpwdcontrollergetx =
      Get.put(ForgetpasswordController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Platform.isAndroid ? Size.fromHeight(40) : Size.fromHeight(40 + 10),
        child: Appbartext(
          title: '',
          elevation: 0.0,
        ),
      ),
      backgroundColor: color.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                lock_forget_pwd,
                height: size.height * 0.2,
              ),
              SizedBox(height: 20),
              Textfield().text(forgotpassword, TextStyles.mb24),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: color.border_grey_color),
                    borderRadius: BorderRadius.circular(15)),
                // height: size.height * 0.065,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: forgetpwdcontrollergetx.email,
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
              ElevatedButtons(
                name: done,
                onTap: () {
                  if (forgetpwdcontrollergetx.email.text.isNotEmpty) {
                    forgetpwdcontrollergetx.forget_password(context);
                    nextScreen(context, Login());
                  } else {
                    Get.snackbar("email is Required", "");
                  }
                },
              ),
              SizedBox(height: 10),
              //
              // GestureDetector(
              //   onTap: (){
              //     nextScreen(
              //         context,
              //         type_account == get_shifter
              //             ? MainHomeScreen_Customer()
              //             : MainHomeScreen_Supplier());
              //   },
              //   child: Container(
              //     width: size.width * 0.7,
              //     // decoration: BoxDecoration(
              //     //     border: Border.all(color: Colors.black)),
              //     child: Text.rich(
              //
              //       // textAlign: TextAlign.center,
              //         TextSpan(
              //             style: TextStyles.withColor(
              //                 TextStyles.mn16, color.black),
              //             text: locationskipmsg,
              //             children: <InlineSpan>[
              //               TextSpan(
              //                 text: skip,
              //                 style: TextStyles.withColor(
              //                     TextStyles.mn16, color.Primary_second_Color),
              //               )
              //             ])),
              //   ),
              // ),
              // Elevatedbuttons().elevatedbutton(enable, MainHomeSCreen(), context)
            ],
          ),
        ),
      ),
    );
  }
}
