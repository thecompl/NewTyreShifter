import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyreshifter/Suppliers/Complete_Order.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'dart:io' show Platform;

import 'Textfield.dart';

class MyShiftwidget extends StatefulWidget {
  final title;
  final email;
  final subtitle;
  final label1;
  final label2;
  final value1;
  final value2;

  final child;
  MyShiftwidget({
    Key? key,
    this.title,
    this.email,
    this.subtitle,
    this.label1,
    this.label2,
    this.value1,
    this.value2,
    this.child,
  }) : super(key: key);

  @override
  State<MyShiftwidget> createState() => _MyShiftwidgetState();
}

class _MyShiftwidgetState extends State<MyShiftwidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Textfield().text(
                widget.title,
                TextStyles.withColor(
                    TextStyles.mb16, color.Primary_second_Color)),
            SizedBox(
              height: 10,
            ),
            Textfield().text(widget.email,
                TextStyles.withColor(TextStyles.mn14, color.textgrey_color)),
            SizedBox(
              height: 10,
            ),
            Textfield().text(widget.subtitle,
                TextStyles.withColor(TextStyles.mn14, color.textgrey_color)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Textfield().text(
                          widget.label1,
                          TextStyles.withColor(
                              TextStyles.mb16, color.Primary_second_Color)),
                      Textfield().text(
                          widget.value2,
                          TextStyles.withColor(
                              TextStyles.mb16, color.txt_dark_color)),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Textfield().text(
                          widget.label2,
                          TextStyles.withColor(
                              TextStyles.mb16, color.Primary_second_Color)),
                      Textfield().text(
                          widget.value2,
                          TextStyles.withColor(
                              TextStyles.mb16, color.txt_dark_color)),
                    ],
                  ),
                ),
                Container(
                  child: widget.child,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
