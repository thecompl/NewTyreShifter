import 'dart:io';

import 'package:flutter/material.dart';

import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';

import '../Widget/Appbartext.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';

class Withdraw extends StatefulWidget {
  Withdraw({Key? key}) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  TextEditingController card_name = TextEditingController();
  TextEditingController card_number = TextEditingController();
  int activebtn = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: withdraw,elevation: 0.0,),),
      // Appbartext().appbar(withdraw,
      //     TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 10, top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textfield().text(personal_bal, TextStyles.mn16),
                          Textfield().text("\$1500.00", TextStyles.mn16)
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // nextScreen(context, Withdraw());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: color.Primary_second_Color,
                          ),
                          child: Textfield().text(
                              withdraw,
                              TextStyles.withletterspacing(
                                  TextStyles.mb16, color.white, 0.5)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Textfield().text(withdraw_to, TextStyles.mb16)),
              SizedBox(
                height: 15,
              ),
              Paymentmethods(credit_card, "Credit Card", 0),
              SizedBox(
                height: 20,
              ),
              Paymentmethods(vipps, back_transfer, 1),
              SizedBox(
                height: 30,
              ),
              activebtn == 0 ? withdraw_through_credit_card() : Container(),
              SizedBox(height: 40),
              ElevatedButtons(name: withdraw)
            ],
          ),
        ),
      ),
    );
  }

  Paymentmethods(imgname, txt, index) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          activebtn = index;
        });

        // nextScreen(context, Payment_card());
      },
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: activebtn == index
                    ? color.Primary_second_Color
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(15),
            color: color.white,
          ),
          padding: EdgeInsets.all(15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Image.asset(imgname, height: size.height * 0.035),
                SizedBox(
                  width: 10,
                ),
                Textfield().text(txt, TextStyles.mb16)
              ],
            ),
          ])),
    );
  }

  withdraw_through_credit_card() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Textfield().text(withdraw_to_credit_card,
              TextStyles.withColor(TextStyles.mb16, color.txt_dark_blue_color)),
        ),
        SizedBox(height: 15),
        textbox(card_name, "Card number", size.width, TextInputType.number),
        SizedBox(
          height: 20,
        ),
        textbox(
            card_number, "Card holder name", size.width, TextInputType.number),
      ],
    );
  }

  textbox(contrl, hint, _width, type) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: color.white,
            border: Border.all(color: color.border_grey_color),
            borderRadius: BorderRadius.circular(15)),
        width: _width,
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            keyboardType: type,
            controller: contrl,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyles.mn14),
          ),
        ),
      ),
    );
  }
}
