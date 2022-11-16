import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tyreshifter/config/Color.dart';
import '../Widget/Appbartext.dart';
import '../Widget/ReviewCardwidget.dart';
import '../Widget/Textfield.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';

class Reviews extends StatefulWidget {
  Reviews({Key? key}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: review),),

      // Appbartext().appbar(
      //     review, TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ReviewCardwidget(
                  bgcolor: color.white,
                  customer_name: 'Jhon doe',
                  custome_name_style: TextStyles.withletterspacing(
                      TextStyles.mb18, color.text_grey2_color, 0.5),
                  desstyle: TextStyles.withletterspacing(
                      TextStyles.mn14, color.textgrey_color, 0.3),
                  destxt:
                      'when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                  img: service_img,
                ),
              );
            }),
      ),
    );
  }
}
