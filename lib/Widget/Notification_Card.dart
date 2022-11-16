import 'package:flutter/material.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';

import '../config/TextStyles/Textstyles.dart';

class Notification_Card extends StatefulWidget {
  final String Img;

  final String txt;

  final style;

  Notification_Card(
      {Key? key, required this.Img, required this.txt, this.style})
      : super(key: key);

  @override
  State<Notification_Card> createState() => _Notification_CardState();
}

class _Notification_CardState extends State<Notification_Card> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: color.white, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Image.asset(
              widget.Img,
              height: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Textfield().text(widget.txt, widget.style),
            )
          ],
        ),
      ),
    );
  }
}
