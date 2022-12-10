import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/Customer/Main%20screen/HomeScreen.dart';
import 'package:tyreshifter/Customer/Main%20screen/Orders.dart';
import 'package:tyreshifter/Customer/MainhomeScreen.dart';
import 'package:tyreshifter/Customer/Myrequest.dart';
import 'package:tyreshifter/Widget/ConfirmationDialog.dart';
import 'package:tyreshifter/Widget/Texboxwidget.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Dialogs/Sent_request.dart';
import 'Send_request.dart';

class Payment_card extends StatefulWidget {
  final type;
  Payment_card({Key? key, this.type}) : super(key: key);

  @override
  State<Payment_card> createState() => _Payment_cardState();
}

class _Payment_cardState extends State<Payment_card> {
  TextEditingController cardno = TextEditingController();
  TextEditingController cardname = TextEditingController();
  TextEditingController expiry = TextEditingController();
  TextEditingController cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,

      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: payment),
      ),

      // Appbartext().appbar(
      //     payment, TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Image.asset(
                paymentimg,
                fit: BoxFit.cover,
                height: size.height * 0.3,
              )),
              SizedBox(
                height: 50,
              ),
              TextBoxwidget(
                prefixshowicon: false,
                hinttext: Card_number,
                hintstyle: TextStyles.mn14,
                controller: cardno,
                keyboradtype: TextInputType.number,
                border_color: color.border_grey_color,
                style: TextStyles.withColor(TextStyles.mb14, color.black),
                ontap: () {},
                readtype: false,
                showicon: false,
              ),
              SizedBox(
                height: 15,
              ),
              TextBoxwidget(
                prefixshowicon: false,
                hinttext: Card_holder_name,
                hintstyle: TextStyles.mn14,
                controller: cardname,
                border_color: color.border_grey_color,
                style: TextStyles.withColor(TextStyles.mb14, color.black),
                ontap: () {},
                readtype: false,
                showicon: false,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBoxwidget(
                    prefixshowicon: false,
                    width: size.width * 0.4,
                    height: 60.0,
                    hinttext: expirytxt,
                    hintstyle: TextStyles.mn14,
                    controller: expiry,
                    border_color: color.border_grey_color,
                    style: TextStyles.withColor(TextStyles.mb14, color.black),
                    ontap: () {},
                    readtype: false,
                    showicon: false,
                  ),
                  TextBoxwidget(
                    prefixshowicon: false,
                    width: size.width * 0.4,
                    height: 60.0,
                    hinttext: cvvtxt,
                    hintstyle: TextStyles.mn14,
                    controller: cvv,
                    border_color: color.border_grey_color,
                    style: TextStyles.withColor(TextStyles.mb14, color.black),
                    ontap: () {},
                    readtype: false,
                    showicon: false,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButtons(
                name: done,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                            txt: sent_reuest,
                            textwidth: 0.6,
                            destxt: req_des,
                            destextwidth: 0.8,
                            head: true,
                            btntxt: view_req,
                            onTap: () {
                              widget.type == 0
                                  ? nextScreen(
                                      context, Myrequest(type: widget.type))
                                  : nextScreen(context,
                                      MainHomeScreen_Customer(pageIndex: 1));
                            },
                          ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
