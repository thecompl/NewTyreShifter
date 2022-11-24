import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'dart:io' show Platform;

import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';

class Appbartext extends StatefulWidget {
  final String title;

  final show_arrow_icon;
  final show_icon;
  final icon;
  final elevation;
  final double? height;
  final colors;
  final Function? ontap;
  final bool? showbottom;
  final bool? showtext;

  final appbartxtstyle;
  final appbartxt;

  Appbartext({
    Key? key,
    required this.title,
    this.icon = 0,
    this.show_icon = 0,
    this.elevation = 1.0,
    this.height = 40.0,
    this.colors = color.white,
    this.ontap,
    this.show_arrow_icon = 0,
    this.showbottom = false,
    this.showtext = false,
    this.appbartxtstyle,
    this.appbartxt,
  }) : super(key: key);
  @override
  State<Appbartext> createState() => _AppbartextState();
}

class _AppbartextState extends State<Appbartext> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: widget.elevation,
        automaticallyImplyLeading: false,
        backgroundColor: widget.colors,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: widget.colors,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.show_arrow_icon == 0
                    ? GestureDetector(
                        onTap: () {
                          backScreen(context);
                        },
                        child: Container(
                          // decoration: BoxDecoration(border: Border.all(color: colo)),
                          width: 40,
                          alignment: Alignment.centerLeft,
                          // decoration: BoxDecoration(border:Border.all(color: Colors.black) ),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: color.black,
                          ),
                        ),
                      )
                    : Container(
                        width: 40,
                      ),
                Expanded(
                  child: Container(
                    // decoration: BoxDecoration(border:Border.all(color: Colors.black) ),
                    // width: MediaQuery.of(context).size.width*.65,
                    // decoration: BoxDecoration(border:Border.all(color: Colors.black) ),
                    child: Text(
                      widget.title,
                      style: TextStyles.withColor(TextStyles.mb16, color.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                widget.show_icon == 1
                    ? GestureDetector(
                        onTap: () {
                          widget.ontap!();
                        },
                        child: Container(
                          decoration: widget.showtext! == false
                              ? BoxDecoration()
                              : BoxDecoration(
                                  color: color.Primary_second_Color,
                                  border: Border.all(
                                      color: color.border_grey4_color,
                                      width: 0),
                                  borderRadius: BorderRadius.circular(15)),
                          alignment: widget.showtext! == false
                              ? Alignment.centerRight
                              : Alignment.topCenter,
                          width: widget.showtext! == false ? 40 : 80,
                          child: widget.showtext! == false
                              ? Icon(
                                  widget.icon,
                                  color: color.black,
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Textfield().text(
                                      widget.appbartxt,
                                      // widget.appbartxtstyle,
                                      TextStyles.withColor(
                                          TextStyles.mb18, color.white)),
                                ),
                        ),
                      )
                    : Container(
                        width: 40,
                      )
              ],
            ),
            Platform.isIOS ? SizedBox(height: 5) : SizedBox(height: 0)
          ],
        ),
        bottom: widget.showbottom!
            ? TabBar(
                tabs: [
                  Tab(
                    text: request,
                  ),
                  Tab(text: confirmed),
                  Tab(text: canceled)
                ],
                labelColor: color.Primary_second_Color,
              )
            : null);
  }

  // appbar(
  //   title,
  //   style,
  //   cntx, [
  //   show_arrow_icon = 0,
  //
  //       show_icon = 0,
  //   icon,
  //       elevation=1.0,
  //
  //       height=40.0,
  //       colors=color.white,
  //
  // ]) {
  //   return
  //
  // }
}
