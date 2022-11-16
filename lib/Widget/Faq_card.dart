import 'package:flutter/material.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';

import '../config/TextStyles/Textstyles.dart';

class Faq_card extends StatefulWidget {
  final style;

  final String txt;

  final String subcardhead;
  bool? showcard;

  final int subcardindex;
  final int? index;
  final String subcardtxt;

  Faq_card(
      {Key? key,
      this.style,
      required this.txt,
      required this.subcardhead,
      required this.subcardindex,
      required this.subcardtxt,
      this.showcard,
      this.index})
      : super(key: key);

  @override
  State<Faq_card> createState() => _Faq_cardState();
}

class _Faq_cardState extends State<Faq_card> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.showcard = !widget.showcard!;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: color.white, borderRadius: BorderRadius.circular(10)),
              height: 60,
              width: size.width,
              child: Textfield().text(widget.txt, widget.style),
            ),
          ),
        ),
        widget.showcard! == true
            ? sub_card(
                widget.subcardhead, widget.subcardtxt, widget.subcardindex)
            : Container()
      ],
    );
  }

  sub_card(head, txt, index) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: color.Primary_second_Color),
              color: color.white,
              borderRadius: BorderRadius.circular(10)),
          height: 130,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textfield().text(
                    head,
                    TextStyles.withletterspacing(
                        TextStyles.mb16, color.Primary_second_Color, 0.5, 1.2)),
                SizedBox(height: 10),
                Textfield().text(
                    txt,
                    TextStyles.withletterspacing(
                        TextStyles.mn14, color.textgrey_color, 0.5, 1.3)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
