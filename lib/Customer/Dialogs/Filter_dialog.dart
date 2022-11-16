import 'package:flutter/material.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/config/Color.dart';

import '../../Widget/Dropdown.dart';
import '../../Widget/Textfield.dart';
import '../../config/TextStyles/Textstyles.dart';
import '../../config/string.dart';

class Filter_dialog extends StatefulWidget {
  Filter_dialog({Key? key}) : super(key: key);

  @override
  State<Filter_dialog> createState() => _Filter_dialogState();
}

class _Filter_dialogState extends State<Filter_dialog> {
  var rating_list = ["High","Low"];
  var price_list = ["High","Low"];
  var distance_list = ['Distance','2km',"3km","4km"];
  var avalabilty_list = ["Monday","Tuesday","Wedneshday","Thursday","Friday","Saturday","Sunday"];

  var currentvalue;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        insetPadding: EdgeInsets.zero,
        child: SizedBox(
          // width: size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Textfield().text(
                      filter,
                      TextStyles.withColor(
                          TextStyles.mb18, color.text_grey2_color)),
                ),
                Container(
                  color: color.white,
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: color.black)),
                  child: Dropdown(
                    width: size.width,
                    hinttxt: "Rating",
                    style: TextStyles.withColor(TextStyles.mn14, color.black),
                    list: rating_list,
                    current_value: currentvalue,
                    // Textalignment: AlignmentDirectional.centerStart,
                    border_color: color.border_grey4_color,
                    height: 52,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: color.white,
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: color.black)),
                  child: Dropdown(
                    width: size.width,
                    hinttxt: "Price",
                    style: TextStyles.withColor(TextStyles.mn14, color.black),
                    list: price_list,
                    current_value: currentvalue,
                    // Textalignment: AlignmentDirectional.centerStart,
                    border_color: color.border_grey4_color,
                    height: 52,
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   color: color.white,
                //   // decoration:
                //   //     BoxDecoration(border: Border.all(color: color.black)),
                //   child: Dropdown(
                //     width: size.width,
                //     hinttxt: "Rating",
                //     style: TextStyles.withColor(TextStyles.mn14, color.black),
                //     list: distance_list,
                //     current_value: currentvalue,
                //     // Textalignment: AlignmentDirectional.centerStart,
                //     border_color: color.border_grey4_color,
                //     height: 52,
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: color.white,
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: color.black)),
                  child: Dropdown(
                    width: size.width,
                    hinttxt: "Availability",
                    style: TextStyles.withColor(TextStyles.mn14, color.black),
                    list: avalabilty_list,
                    current_value: currentvalue,
                    // Textalignment: AlignmentDirectional.centerStart,
                    border_color: color.border_grey4_color,
                    height: 52,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButtons(
                  name: done,
                  onTap: () {
                    print("hii");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
