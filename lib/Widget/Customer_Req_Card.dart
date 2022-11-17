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

class Customer_Req_Card extends StatefulWidget {
  final String Img;
  final String headtxt;
  final String adddress;
  final bool? msg;
  final bool? track;
  final bool btntype;
  final bool showbtn;

  final Function? Ontap;
  final Function? ontapbtn;
  final btnname;

  final btncolor;

  final color;

  Customer_Req_Card({
    Key? key,
    required this.Img,
    required this.headtxt,
    required this.adddress,
    this.msg = true,
    this.track = false,
    this.btntype = false,
    this.Ontap,
    this.btnname,
    this.btncolor,
    this.showbtn = true,
    this.ontapbtn,
    this.color,
  }) : super(key: key);

  @override
  State<Customer_Req_Card> createState() => _Customer_Req_CardState();
}

class _Customer_Req_CardState extends State<Customer_Req_Card> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        widget.Ontap!();
        // nextScreen(cntx, Booking_Details());
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          // elevation: 0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color.white,
          ),
          // color: widget.immidate ? color.immidate_cancel_bg : color.white,
          // shape: RoundedRectangleBorder(
          //   side: BorderSide(color: Colors.white70, width: 1),
          //   borderRadius: BorderRadius.circular(15),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
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
                            height: 70,
                            child: Image.asset(widget.Img,
                                fit: BoxFit.cover), //Text
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
                                      .text(widget.headtxt, TextStyles.mb16),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30,
                                        // decoration: BoxDecoration(
                                        //     border:
                                        //         Border.all(color: color.black)),
                                        child: Icon(
                                          Icons.location_on_outlined,
                                          color: color.Primary_second_Color,
                                          size: 20,
                                        ),
                                      ),
                                      Container(
                                        width: size.width * 0.5,
                                        child: Textfield().text(
                                            widget.adddress,
                                            TextStyles.withColor(
                                                TextStyles.mn16,
                                                color.textgrey_color),
                                            TextAlign.left,
                                            TextOverflow.ellipsis),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                                height: 10,
                                                width: 20,
                                                child:
                                                    Image.asset(tryeicon_img)),
                                            Textfield().text(
                                              "kr840",
                                              TextStyles.withColor(
                                                  TextStyles.mb14,
                                                  color.Primary_second_Color),
                                            )
                                          ],
                                        ),
                                      ),
                                      Textfield().text(
                                          "30 April 2022",
                                          TextStyles.withColor(TextStyles.mb14,
                                              color.txt_dark_color)),
                                    ],
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

              Container(
                color: color.white,
                child: Image.asset(
                  divider,
                  width: size.width,
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: color.skylight,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(staricon, height: size.height * 0.04),
                            SizedBox(
                              width: 10,
                            ),
                            Textfield().text(
                                "4.5",
                                TextStyles.withColor(
                                    TextStyles.mn16, color.textgrey_color))
                          ],
                        ),
                        // if (widget.track == true)
                        GestureDetector(
                          onTap: () => {
                            // widget.track == true ?  nextScreen(context,
                            //        Assistance_Cart()) : ''
                          },
                          child: Row(
                            children: [
                              widget.track == true
                                  ? Image.asset(kmicon,
                                      height: size.height * 0.04)
                                  : SvgPicture.string(locationsvg),
                              SizedBox(
                                width: 10,
                              ),
                              Textfield().text(
                                  "5 KM",
                                  TextStyles.withColor(
                                      TextStyles.mb16,
                                      widget.track == true
                                          ? color.text_grey2_color
                                          : color.border_grey_color))
                            ],
                          ),
                        ),
                        // if (widget.msg == true)
                        GestureDetector(
                          onTap: () => {
                            // widget.msg == true ?  nextScreen(context,
                            //        Assistance_Cart()) : ''
                          },
                          child: Row(children: [
                            widget.msg == true
                                ? Image.asset(msg_icon,
                                    height: size.height * 0.04)
                                : SvgPicture.string(messagesvg),
                            SizedBox(
                              width: 10,
                            ),
                            Textfield().text(
                                msg,
                                TextStyles.withColor(
                                    TextStyles.mn16,
                                    widget.msg == true
                                        ? color.textgrey_color
                                        : color.border_grey_color))
                          ]),
                        )
                      ])),
              widget.showbtn
                  ? widget.btntype
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ElevatedButtons(
                              //   name: repeat_order,
                              //   width: 0.35,
                              //   height: 40,
                              //   colorbtn: color.Primary_second_Color,
                              //   style: TextStyles.mb14,
                              //   borderRadius: 5,
                              // ),
                              ElevatedButtons(
                                  // name: complete,
                                  name: widget.btnname,
                                  // width: 0.45,
                                  width: 0.85,
                                  height: 40,
                                  colorbtn: color.btncolor2,
                                  style: TextStyles.mb14,
                                  borderRadius: 5,
                                  onTap: () {
                                    widget.ontapbtn!();
                                  }),
                            ],
                          ),
                        )
                      : Center(
                          child: ElevatedButtons(
                            name: widget.btnname,
                            width: 0.85,
                            height: 40,
                            colorbtn: widget.color,
                            style: TextStyles.withColor(
                                TextStyles.mb14, color.white),
                            borderRadius: 5,
                            onTap: () {
                              widget.ontapbtn!();
                            },
                          ),
                        )
                  : Container(),

              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: ElevatedButton_myreq(
              //       btn_change == value ? working : completed,
              //       cntx,
              //       size.width,
              //       TextStyles.mb14,
              //       btn_change == value ? color.btncolor3 : color.btncolor2),
              // ),
              widget.showbtn
                  ? SizedBox(
                      height: 10,
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
