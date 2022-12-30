import 'package:flutter/material.dart';
import 'package:tyreshifter/Suppliers/MainhomeScreen.dart';
import 'package:tyreshifter/Suppliers/My_Booking.dart';
import 'package:tyreshifter/Widget/ConfirmationDialog.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Common/MessageScreen.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Button.dart';
import 'Textfield.dart';

class Booking_Card extends StatefulWidget {
  final String Img;
  final String headtxt;
  final String adddress;
  final bool? msg;
  final bool showbtn;
  final bool btntype;
  final Function? Ontap;
  final btnname;
  final bool immidate;
  final btncolor;
  final Function? ontapimmidatecancle;

  Booking_Card(
      {Key? key,
      required this.Img,
      required this.headtxt,
      required this.adddress,
      this.msg = true,
      this.showbtn = true,
      this.btntype = false,
      this.Ontap,
      this.btnname,
      this.btncolor,
      this.immidate = false,
      this.ontapimmidatecancle})
      : super(key: key);

  @override
  State<Booking_Card> createState() => _Booking_CardState();
}

class _Booking_CardState extends State<Booking_Card> {
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
            color: widget.immidate ? color.immidate_cancel_bg : color.white,
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
                  color: widget.immidate ? color.white : Colors.transparent,
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
                          CircleAvatar(
                            radius: 30,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(widget.Img,
                                    fit: BoxFit.cover)), //Text
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Textfield().text(
                                          widget.headtxt, TextStyles.mb16),
                                      widget.msg!
                                          ? GestureDetector(
                                              onTap: () {
                                                nextScreen(
                                                    context, MessageScreen());
                                              },
                                              child: Container(
                                                  height: 30,
                                                  child: Image.asset(msg_icon)),
                                            )
                                          : Container(
                                              height: 30,
                                            )
                                    ],
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
                                  Container(
                                    child: Textfield().text(
                                        EmpName + " : " + "Abhi Roy",
                                        TextStyles.withColor(TextStyles.mb14,
                                            color.text_grey2_color)),
                                  ),
                                  Container(
                                    child: Textfield().text(
                                        change_tyre,
                                        TextStyles.withColor(TextStyles.mb14,
                                            color.Primary_second_Color)),
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
                    color: widget.immidate ? color.white : Colors.transparent,
                    // color: color.skylight,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textfield().text(
                            "30 April 2022 06:37 PM",
                            TextStyles.withColor(
                                TextStyles.mb14, color.txt_dark_color)),
                        Row(
                          children: [
                            Image.asset(kmicon, height: size.height * 0.04),
                            SizedBox(
                              width: 10,
                            ),
                            Textfield().text("5 KM", TextStyles.mb16)
                          ],
                        ),
                      ])),
              widget.showbtn
                  ? Center(
                      child: ElevatedButtons(
                        name: widget.btnname,
                        width: 0.8,
                        height: 40,
                        colorbtn: widget.btncolor,
                        style: TextStyles.mb14,
                        borderRadius: 5,
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
              widget.immidate
                  ? SizedBox(
                      height: 5,
                    )
                  : SizedBox(height: 2),
              widget.immidate
                  ? Container(
                      height: 35,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 100,
                              child: GestureDetector(
                                  child: Textfield().text(
                                      cancel,
                                      TextStyles.withColor(
                                        TextStyles.mb16,
                                        color.immidate_cancel_text,
                                      ),
                                      TextAlign.center),
                                  onTap: () {
                                    widget.ontapimmidatecancle!();
                                    // backScreen(context);
                                  }),
                            ),
                            Container(
                              height: 30,
                              alignment: Alignment.center,
                              child: VerticalDivider(
                                thickness: 1,
                                color: color.immidate_cancel_text,
                                width: 5,
                              ),
                            ),
                            Container(
                              width: 100,
                              child: GestureDetector(
                                  child: Textfield().text(
                                      accept,
                                      TextStyles.withColor(
                                        TextStyles.mb16,
                                        color.immidate_cancel_text,
                                      ),
                                      TextAlign.center),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            ConfirmationDialog(
                                              btntxt: done,
                                              destxt: submit_msg_txt,
                                              onTap: () {
                                                nextScreen(context,
                                                    MainHomeScreen_Supplier());
                                              },
                                            ));
                                  }),
                            ),
                          ]),
                    )
                  : Container(),
              widget.immidate
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox(
                      height: 5,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
