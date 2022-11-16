import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Paymentcardwidget.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Payment_card.dart';

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: payment),),

      // Appbartext().appbar(payment,
      //     TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
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
              PaymentcardWidget(
                bgcolor: color.skylight,
                imgname: credit_card,
                txt: 'Credit Card',
                height: 25.0,
                ontap: () {
                  nextScreen(context, Payment_card());
                },
              ),
              SizedBox(
                height: 15,
              ),
              PaymentcardWidget(
                bgcolor: color.skylight,
                imgname: vipps,
                txt: 'VIPPS',
                height: 25.0,
                ontap: () {
                  nextScreen(context, Payment_card());
                },
              ),
              SizedBox(
                height: 15,
              ),
              PaymentcardWidget(
                bgcolor: color.skylight,
                imgname: apple_icon,
                txt: 'Apple Pay',
                height: 25.0,
                ontap: () {
                  nextScreen(context, Payment_card());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Paymentmethods(imgname, txt) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        nextScreen(context, Payment_card());
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color.skylight,
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
                Textfield().text(txt, TextStyles.mb14)
              ],
            ),
            Icon(Icons.arrow_forward_ios_sharp)
          ])),
    );
  }
}
