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

class Assistance_immediately_Card extends StatefulWidget {
  final String Img;
  final String headtxt;
  final String price;
  final String adddress;
  final bool? msg;
  final bool btntype;
  final bool showbtn;
  final Function? Ontap;
  final btnname;

  final btncolor;

  Assistance_immediately_Card({
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
  }) : super(key: key);

  @override
  State<Assistance_immediately_Card> createState() =>
      _Assistance_immediately_CardState();
}

class _Assistance_immediately_CardState
    extends State<Assistance_immediately_Card> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        // elevation: 0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              border:
                                  Border.all(color: color.border_grey4_color)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          height: 140,
                          child:
                              Image.asset(widget.Img, fit: BoxFit.cover), //Text
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: color.black)),
                            // padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textfield()
                                    .text(widget.headtxt, TextStyles.mb14),
                                // SizedBox(
                                //   height: 3,
                                // ),
                                Textfield().text(
                                  widget.price,
                                  TextStyles.withColor(TextStyles.mb14,
                                      color.Primary_second_Color),
                                ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Container(
                                    //   height: 30,
                                    //   // decoration: BoxDecoration(
                                    //   //     border:
                                    //   //         Border.all(color: color.black)),
                                    //   child: Icon(
                                    //     Icons.location_on_outlined,
                                    //     color: color.Primary_second_Color,
                                    //     size: 20,
                                    //   ),
                                    // ),
                                    Expanded(
                                      // width: size.width * 0.5,
                                      child: Textfield().text(
                                          widget.adddress,
                                          TextStyles.withColor(TextStyles.mn14,
                                              color.txt_dark_color),
                                          TextAlign.left,
                                          TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButtons(
                                  width: 0.3,
                                  height: 35,
                                  name: buynow,
                                  borderRadius: 10,
                                  // style: TextStyles.mb16,
                                  onTap: () {
                                    widget.Ontap!();
                                    // nextScreen(context, Assistance_tyreListDetail());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
