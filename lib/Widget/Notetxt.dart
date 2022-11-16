import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/string.dart';

import '../config/TextStyles/Textstyles.dart';

class Notetxt extends StatefulWidget {
  final String txt;
  Notetxt({Key? key, required this.txt}) : super(key: key);

  @override
  State<Notetxt> createState() => _NotetxtState();
}

class _NotetxtState extends State<Notetxt> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 5),
              alignment: Alignment.topLeft,
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              height: 20,
              child: SvgPicture.string(check_iconsvg)),
          SizedBox(
            width: 10,
          ),
          Container(
            // height: 80,
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: size.width * 0.72,
            child: Textfield().text(
              widget.txt,
              TextStyles.withColor(TextStyles.mn16, color.textgrey_color),
            ),
          )
        ],
      ),
    );
  }
}
