import 'package:flutter/material.dart';
import 'package:tyreshifter/Customer/Assistance_tyreListDetail.dart';
import 'package:tyreshifter/Customer/Dialogs/Cancel_req_dialog.dart';
import 'package:tyreshifter/Widget/ConfirmationDialog.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Button.dart';
import 'Textfield.dart';

class SupplierProductListwidget extends StatefulWidget {
  final String Img;
  final String headtxt;
  final String price;
  final String adddress;
  final bool? msg;
  final bool btntype;
  final bool added;
  final bool showbtn;
  final Function? Ontap;
  final Function? Onbtntap;
  final btnname;

  final btncolor;

  SupplierProductListwidget({
    Key? key,
    required this.Img,
    required this.headtxt,
    required this.price,
    required this.adddress,
    this.msg = true,
    this.btntype = false,
    this.Ontap,
    this.btnname,
    this.btncolor,
    this.showbtn = true,
    this.added = false,
    this.Onbtntap,
  }) : super(key: key);

  @override
  State<SupplierProductListwidget> createState() =>
      _SupplierProductListwidgetState();
}

class _SupplierProductListwidgetState extends State<SupplierProductListwidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        widget.Ontap!();
        // nextScreen(cntx, Booking_Details());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width*0.43,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: color.border_grey4_color)),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: Image.asset(widget.Img, fit: BoxFit.fill), //Text
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: size.width*0.43,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textfield().text(widget.headtxt, TextStyles.mb14),
                      Textfield().text(
                        widget.price,
                        TextStyles.withColor(
                            TextStyles.mb14, color.Primary_second_Color),
                      ),
                      Container(
                        // width: size.width * 0.5,
                        child: Textfield().text(
                            widget.adddress,
                            TextStyles.withColor(
                                TextStyles.mn14, color.txt_dark_color),
                            TextAlign.left,
                            TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButtons(
                        // width: 0.4,
                        height: 35,
                        name: widget.added ? added : addtocart,
                        borderRadius: 10,
                        colorbtn: widget.added
                            ? color.txt_dark_color
                            : color.Primary_second_Color,
                        onTap: () {
                          widget.Onbtntap!();
                          // nextScreen(context, Assistance_tyreListDetail());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
