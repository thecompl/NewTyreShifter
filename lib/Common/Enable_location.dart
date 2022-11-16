import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyreshifter/Customer/Main%20screen/HomeScreen.dart';
import 'package:tyreshifter/Customer/MainhomeScreen.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';

import '../Widget/Appbartext.dart';
import '../config/string.dart';
import '../Suppliers/MainhomeScreen.dart';

class Enable_location extends StatefulWidget {
  Enable_location({Key? key}) : super(key: key);

  @override
  State<Enable_location> createState() => _Enable_locationState();
}

class _Enable_locationState extends State<Enable_location> {
  String? type_account;
  @override
  void initState() {
    get_typeaccount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: '',elevation: 0.0,show_arrow_icon: 1,show_icon: 1,
          showtext: true,
          appbartxt: skip,
          appbartxtstyle: TextStyles.withColor(TextStyles.mb18, color.Primary_second_Color),
          ontap: (){
          nextScreen(
              context,
              type_account == get_shifter
                  ? MainHomeScreen_Customer()
                  : MainHomeScreen_Supplier());
        },),),

      backgroundColor: color.white,
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: [
            Image.asset(
              location_globe,
              height: size.height * 0.25,
            ),
            SizedBox(height: 20),
            Textfield().text(enable_locationtxt, TextStyles.mb26),
            SizedBox(
              height: 10,
            ),
            type_account == become_shifter
                ? Container(
                    width: size.width * 0.8,
                    child: Textfield().text(
                        enable_locatin_msg,
                        TextStyles.withColor(
                            TextStyles.mn16, color.textgrey_color),
                        TextAlign.center),
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            ElevatedButtons(
              name: enable,
              onTap: () {
                nextScreen(
                    context,
                    type_account == get_shifter
                        ? MainHomeScreen_Customer()
                        : MainHomeScreen_Supplier());
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
