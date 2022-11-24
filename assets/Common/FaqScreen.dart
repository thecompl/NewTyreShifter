import 'dart:io';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:tyreshifter/config/Color.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Faq_card.dart';
import '../Widget/Textfield.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';

class FaqScreen extends StatefulWidget {
  FaqScreen({Key? key}) : super(key: key);
  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  List<bool>? showcardlist = List.filled(10, false);
  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: color.skylight,
        appBar: PreferredSize(
          preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
          child: Appbartext(title: faq),),

        // Appbartext().appbar(
        //     faq, TextStyles.withColor(TextStyles.mb16, color.black), context),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          height: size.height,
          width: size.width,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, i) {
                return Faq_card(
                  showcard: showcardlist![i],
                  txt: "Lorem ipsum dolor sit amet?",
                  style: TextStyles.withletterspacing(
                    TextStyles.mb16,
                    color.text_grey2_color,
                    0.5,
                    1.2,
                  ),
                  subcardhead: "Lorem ipsum dolor sit amet?",
                  subcardindex: i,
                  subcardtxt:
                      i.toString()+'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit',
                );
              }),
        ));
  }
}
