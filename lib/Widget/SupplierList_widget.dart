import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tyreshifter/Customer/Assistance_Cart.dart';
import 'package:tyreshifter/Customer/Dialogs/Cancel_req_dialog.dart';
import 'package:tyreshifter/Widget/ConfirmationDialog.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Button.dart';
import 'Textfield.dart';

class SupplierList_widget extends StatefulWidget {
  final String Img;
  final String headtxt;
  final String adddress;
  final Function? Ontap;
  final color;

  final supplier;

  SupplierList_widget({
    Key? key,
    required this.Img,
    required this.headtxt,
    required this.adddress,
    this.Ontap,
    this.color,
    this.supplier,
  }) : super(key: key);

  @override
  State<SupplierList_widget> createState() => _SupplierList_widgetState();
}

class _SupplierList_widgetState extends State<SupplierList_widget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        widget.Ontap!();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: color.border_grey4_color),
            borderRadius: BorderRadius.circular(10),
            color: color.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 85,
                  child: Image.asset(widget.Img, fit: BoxFit.cover), //Text
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Textfield().text(widget.headtxt, TextStyles.mb16),
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Transform.scale(
                                    scale: 1.2, child: widget.supplier),
                              ),
                            ]),
                        SizedBox(height: 10),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                // decoration: BoxDecoration(
                                //     border: Border.all(color: color.black)),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: color.Primary_second_Color,
                                  size: 20,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: size.width * 0.5,
                                  child: Textfield().text(
                                      widget.adddress,
                                      TextStyles.withColor(TextStyles.mn16,
                                          color.textgrey_color),
                                      TextAlign.left,
                                      TextOverflow.ellipsis),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
