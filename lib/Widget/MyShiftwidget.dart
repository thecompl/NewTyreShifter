import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/Suppliers/Complete_Order.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/config/string.dart';
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
  final child1;
  final child2;
  final child3;

  MyShiftwidget({
    Key? key,
    this.title,
    this.email,
    this.subtitle,
    this.label1,
    this.label2,
    this.value1,
    this.value2,
    this.child1,
    this.child3,
    this.child2,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Row(children: [
              Container(
                child: widget.child1!,
              ),
              SizedBox(width: 10),
              Textfield().text(widget.title,
                  TextStyles.withColor(TextStyles.mb16, color.txt_dark_color)),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: widget.child2!,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textfield().text(
                              widget.label1,
                              TextStyles.withColor(TextStyles.mb16,
                                  color.Primary_second_Color, 1.2)),
                          SizedBox(
                            height: 5,
                          ),
                          Textfield().text(
                              widget.value2,
                              TextStyles.withColor(
                                  TextStyles.mb16, color.txt_dark_color)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 50),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: widget.child3!,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textfield().text(
                              widget.label2,
                              TextStyles.withColor(TextStyles.mb16,
                                  color.Primary_second_Color, 1.2)),
                          SizedBox(
                            height: 5,
                          ),
                          Textfield().text(
                              widget.value2,
                              TextStyles.withColor(
                                  TextStyles.mb16, color.txt_dark_color)),
                        ],
                      ),
                    ],
                  ),
                ),
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
