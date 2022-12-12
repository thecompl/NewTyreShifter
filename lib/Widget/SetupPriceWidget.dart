import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tyreshifter/Widget/SetupPriceCardWidget.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/string.dart';

import '../config/TextStyles/Textstyles.dart';

class SetupPriceWidget extends StatefulWidget {
  final style;

  final service;

  final title;

  final price;

  final Function? Oncardtap;

  final length;

  SetupPriceWidget({
    Key? key,
    this.style,
    this.service,
    this.title,
    this.price,
    this.Oncardtap,
    this.length,
  }) : super(key: key);

  @override
  State<SetupPriceWidget> createState() => _SetupPriceWidgetState();
}

class _SetupPriceWidgetState extends State<SetupPriceWidget> {
  var grpvalu;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Textfield().text(widget.title, TextStyles.mb18),
      SizedBox(height: 30),
      ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.service.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SetupPriceCardWidget(
                service: widget.service[index]['service_name'],
                price: widget.price,
                Oncardtap: () {
                  widget.Oncardtap!();
                },
              ),
            );
          }),
    ]));
  }
}
