import 'package:flutter/material.dart';

import '../config/TextStyles/Textstyles.dart';
import 'Textfield.dart';

class PaymentcardWidget extends StatefulWidget {
  final Function? ontap;

  final String imgname;

  final height;

  final String txt;

  final bgcolor;
  PaymentcardWidget(
      {Key? key, this.ontap, required this.imgname, this.height, this.bgcolor, required this.txt})
      : super(key: key);

  @override
  State<PaymentcardWidget> createState() => _PaymentcardWidgetState();
}

class _PaymentcardWidgetState extends State<PaymentcardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.ontap!();
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.bgcolor,
          ),
          padding: EdgeInsets.all(15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Image.asset(widget.imgname, height: widget.height),
                SizedBox(
                  width: 10,
                ),
                Textfield().text(widget.txt, TextStyles.mb14)
              ],
            ),
            Icon(Icons.arrow_forward_ios_sharp)
          ])),
    );
    ;
  }
}
