import 'package:flutter/material.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';

import '../config/TextStyles/Textstyles.dart';

class SetupPriceCardWidget extends StatefulWidget {
  final style;

  final service;

  final title;

  final price;

  final bool? showIcon;

  final IconData? icon;

  final Function? Oncardtap;

  SetupPriceCardWidget(
      {Key? key,
      this.style,
      this.service,
      this.title,
      this.price,
      this.Oncardtap,
      this.showIcon = false,
      this.icon})
      : super(key: key);

  @override
  State<SetupPriceCardWidget> createState() => _SetupPriceCardWidgetState();
}

class _SetupPriceCardWidgetState extends State<SetupPriceCardWidget> {
  var grpvalu;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GestureDetector(
        onTap: (() {
          widget.Oncardtap!();
        }),
        child: Card(
          child: Padding(
            padding: widget.showIcon == true
                ? const EdgeInsets.symmetric(horizontal: 15, vertical: 20)
                : const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textfield().text(
                    widget.service,
                    TextStyles.withColor(TextStyles.mb14, color.txt_dark_color),
                    TextAlign.center),
                widget.showIcon == true
                    ? Icon(
                        widget.icon,
                        color: color.black,
                      )
                    : Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Textfield().text(
                              widget.price,
                              TextStyles.withColor(
                                  TextStyles.mb14, color.txt_dark_color),
                              TextAlign.center),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
