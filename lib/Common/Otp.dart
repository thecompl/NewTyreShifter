import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:otp_screen/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyreshifter/Suppliers/Welcome_Tyreshifter.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import '../Widget/Appbartext.dart';
import '../Widget/ConfirmationDialog.dart';
import '../Widget/Gesture.dart';
import '../Widget/Textfield.dart';
import '../config/Color.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'package:pinput/pinput.dart';
import 'Enable_location.dart';
import '../Suppliers/MainhomeScreen.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String _code = '';

  bool _onEditing = false;

  String? type_account;

  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "123456") {
      return "right otp";
    } else {
      return "The entered Otp is wrong";
    }
  }

  void moveToNextScreen(context) {
    // Navigator.push(context, MaterialPageRoute(
    //     builder: (context) => SuccessfulOtpScreen()));
  }
  final controller = TextEditingController();
  final focusNode = FocusNode();
  @override
  void initState() {
    get_typeaccount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const borderColor = Color.fromRGBO(30, 60, 87, 1);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 50,
      textStyle: TextStyles.withColor(TextStyles.mb26, color.black),
      decoration: BoxDecoration(),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 100,
          height: 5,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 10,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.circle,
            color: color.black,
            size: 15,
          ),
        ),
      ],
    );

    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:
            Platform.isAndroid ? Size.fromHeight(40) : Size.fromHeight(40 + 10),
        child: Appbartext(title: '', elevation: 0.0),
      ),

      // Appbartext().appbar(
      //     '',
      //     TextStyles.withColor(TextStyles.mb16, color.black),
      //     context,
      //     0,0,'',0.0),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.center,
                  height: 120,
                  child: Image.asset(otpimg)),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Textfield().text(verification,
                    TextStyles.withColor(TextStyles.mb24, color.black)),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Textfield().text(
                    "Enter your OTP code here",
                    TextStyles.withColor(
                        TextStyles.mn14, color.textgrey_color)),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   alignment: Alignment.center,
              //   child: VerificationCode(
              //     textStyle: TextStyles.withColor(
              //         TextStyles.mb26, color.txt_dark_blue_color),
              //     keyboardType: TextInputType.number,
              //     underlineColor: color.border_grey_color,
              //     underlineWidth: 5,
              //     // If this is null it will use primaryColor: Colors.red from Theme
              //     length: 4,
              //     cursorColor: Colors
              //         .blue, // If this is null it will default to the ambient
              //     // clearAll is NOT required, you can delete it
              //     // takes any widget, so you can implement your design
              //     // clearAll: Padding(
              //     //   padding: const EdgeInsets.all(8.0),
              //     //   child: Text(
              //     //     'clear all',
              //     //     style: TextStyle(
              //     //         fontSize: 14.0,
              //     //         decoration: TextDecoration.underline,
              //     //         color: Colors.blue[700]),
              //     //   ),
              //     // ),
              //     onCompleted: (String value) {
              //       setState(() {
              //         _code = value;
              //       });
              //     },
              //     onEditing: (bool value) {
              //       setState(() {
              //         _onEditing = value;
              //       });
              //       if (!_onEditing) FocusScope.of(context).unfocus();
              //     },
              //   ),
              // ),

              Container(
                alignment: Alignment.center,
                height: 50,
                child: Pinput(
                  length: 4,
                  pinAnimationType: PinAnimationType.none,
                  controller: controller,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  showCursor: true,
                  cursor: cursor,
                  preFilledWidget: preFilledWidget,
                ),
              ),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 10, top: 15),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // nextScreen(context, CreateAccount());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Textfield().text(
                              "Did you not get OTP? ",
                              TextStyles.withColor(
                                TextStyles.mn16,
                                color.textgrey_color,
                              ),
                              TextAlign.center),
                          Textfield().text(
                              "Resend",
                              TextStyles.withColor(
                                  TextStyles.mb20, color.black),
                              TextAlign.center),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    ElevatedButtons(
                      name: verify,
                      onTap: () {
                        type_account == get_shifter
                            ? nextScreen(context, Enable_location())
                            : showDialog(
                                context: context,
                                builder: (context) => ConfirmationDialog(
                                      destextwidth: 0.7,
                                      btntxt: done,
                                      destxt: verification_msg_txt,
                                      onTap: () {
                                        backScreen(context);
                                        nextScreen(
                                            context, Welcome_Tyreshifter());
                                      },
                                    ));
                      },
                    )
                    // Elevatedbuttons()
                    //     .elevatedbutton(verify, Enable_location(), context)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  get_typeaccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type_account = prefs.getString("type");
    });

    print("type" + type_account.toString());
  }
}
