import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyreshifter/Common/CalenderScreen.dart';
import 'package:tyreshifter/Suppliers/Complete_Order.dart';

import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/config/string.dart';

import '../Widget/Appbartext.dart';
import 'Login.dart';

import '../Suppliers/Register_Req.dart';
import '../Suppliers/Set_Availability.dart';
import '../Suppliers/Setprice.dart';
import '../Widget/Textfield.dart';

class Get_StartedScreen extends StatefulWidget {
  const Get_StartedScreen({Key? key}) : super(key: key);

  @override
  _Get_StartedScreenState createState() => _Get_StartedScreenState();
}

class _Get_StartedScreenState extends State<Get_StartedScreen> {
  String? type = become_shifter;

  String? type_account;
  @override
  void initState() {
    GetStorage().write("lang", "English");
    GetStorage().write("type", become_shifter);
    set_typeaccount();
    get_typeaccount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      // appBar: PreferredSize(
      //     preferredSize: Platform.isAndroid?  Size.fromHeight(20):Size.fromHeight(30),
      //   child: Appbartext(title: '',show_arrow_icon: 1,elevation: 0.0,colors: Colors.black,)),

      // Appbartext().appbar(
      //       '',
      //       TextStyles.withColor(TextStyles.mb16, color.black),
      //       context,
      //       1,0,'',0.0,0.0),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 60),
            // GestureDetector(
            //   onTap: () {},
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           GetStorage().write("lang", "English");
            //         },
            //         child: Column(
            //           children: [
            //             Image.asset(
            //               english,
            //               height: 40,
            //               width: 40,
            //             ),
            //             SizedBox(
            //               width: 10,
            //             ),
            //             Textfield().text(
            //               "English",
            //               TextStyles.withColor(
            //                   TextStyles.mn12, color.black, 1.2),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           GetStorage().write("lang", "Norwegion");
            //         },
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Image.asset(
            //               norway,
            //               height: 40,
            //               width: 40,
            //             ),
            //             SizedBox(
            //               width: 10,
            //             ),
            //             Textfield().text(
            //               "Norwegian",
            //               TextStyles.withColor(
            //                   TextStyles.mn12, color.black, 1.2),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //     border:
                    //         Border.all(color: color.Primary_second_Color)),
                    child: Image.asset(
                      logo_without_tag,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    lets_get_started,
                    textAlign: TextAlign.center,
                    style: TextStyles.mb26,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.75,
                    child: Textfield().text(
                      get_start_dmsg,
                      TextStyles.withColor(
                          TextStyles.mn18, color.textgrey_color, 1.2),
                      TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          GetStorage().write("type", become_shifter);
                          setState(() {
                            type = become_shifter;
                            set_typeaccount();
                          });
                        },
                        child: ElevatedButtons(
                            name: become_shifter,
                            onTap: () {
                              setState(() {
                                type = become_shifter;
                              });
                              set_typeaccount();
                              // nextScreen(
                              //     context,
                              //     type == become_shifter
                              //         ? Register_req()
                              //         : Login());
                              nextScreen(context, Login());
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // print("hii");
                          GetStorage().write("type", get_shifter);
                          setState(() {
                            type = get_shifter;
                            set_typeaccount();
                          });
                        },
                        child: ElevatedButtons(
                            name: get_shifter,
                            onTap: () {
                              setState(() {
                                type = get_shifter;
                              });
                              set_typeaccount();
                              nextScreen(
                                  context,
                                  type == become_shifter
                                      ? Register_req()
                                      : Login());
                            }),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  )
                ],
              ),
            ),

            // ElevatedButtons(
            //     name: get_started,
            //     onTap: () {
            //       nextScreen(context,
            //           type == become_shifter ? Register_req() : Login());
            //     }),
            // SizedBox(
            //   height: 10,
            // )

            // Elevatedbuttons().elevatedbutton(
            //   get_started,
            //   Register_req(),
            //   context,
            // )
          ],
        ),
      ),
    );
  }

  set_typeaccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("type", type!);
  }

  get_typeaccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type_account = prefs.getString("type");
    });
    print("type" + type_account.toString());
  }
}
