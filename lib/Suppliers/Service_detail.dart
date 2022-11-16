import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/Customer/Dialogs/Sent_request.dart';

import 'package:tyreshifter/Widget/ConfirmationDialog.dart';
import 'package:tyreshifter/config/Color.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../Widget/Dropdown.dart';
import '../Widget/Textfield.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Complete_Order.dart';
import 'My_Booking.dart';

class Service_Details extends StatefulWidget {
  final bool? dropdown;
  final String? pagetype;
  final String? status;
  Service_Details({
    Key? key,
    this.dropdown,
    this.pagetype,
    this.status,
  }) : super(key: key);

  @override
  State<Service_Details> createState() => _Service_DetailsState();
}

class _Service_DetailsState extends State<Service_Details> {
  var currentvalue;
  @override
  void initState() {
    print(widget.pagetype);
    print(widget.status);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: widget.pagetype == booking_details && widget.status == working ?booking_details:widget.pagetype == booking_details &&
            widget.status == complete?complete:details, show_arrow_icon:widget.dropdown! == false || widget.pagetype == booking_details ? 0:1,elevation: 1.0,),),
      //
      // AppBar(
      //   elevation: 1,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: color.white,
      //   title: Center(
      //       child:
      //           widget.pagetype == booking_details && widget.status == working
      //               ? Textfield().text(
      //                   booking_details,
      //                   TextStyles.withColor(
      //                       TextStyles.mb16, color.text_grey2_color))
      //               : widget.pagetype == booking_details &&
      //                       widget.status == complete
      //                   ? Textfield().text(
      //                       complete,
      //                       TextStyles.withColor(
      //                           TextStyles.mb16, color.text_grey2_color))
      //                   : Textfield().text(
      //                       details,
      //                       TextStyles.withColor(
      //                           TextStyles.mb16, color.text_grey2_color))),
      // ),
      //
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child:
                          Image.asset(service_img, fit: BoxFit.cover)), //Text
                ),
                SizedBox(
                  width: 10,
                ),
                Textfield().text(
                    "Jaylon Rosser",
                    TextStyles.withColor(
                        TextStyles.mb16, color.txt_dark_blue_color)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5, bottom: 5),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: color.Primary_second_Color,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: size.width * 0.5,
                        child: Textfield().text(
                            "752 Longbranch St.Calhoun, GA 30701",
                            TextStyles.withColor(
                                TextStyles.mn16, color.textgrey_color)),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(tryeicon_img),
                        SizedBox(
                          width: 5,
                        ),
                        Textfield().text(
                            "Kr840",
                            TextStyles.withColor(
                                TextStyles.mb16, color.Primary_second_Color))
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(height: 25, child: Image.asset(verified))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Row(
                    children: [
                      Image.asset(kmicon, height: size.height * 0.04),
                      SizedBox(
                        width: 10,
                      ),
                      Textfield().text("5 KM", TextStyles.mb16)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textfield().text(
                          completed_orders,
                          TextStyles.withColor(
                              TextStyles.mb16, color.txt_dark_blue_color)),
                      Textfield().text(
                          "10",
                          TextStyles.withColor(
                              TextStyles.mn14, color.textgrey_color)),
                    ],
                  )
                ])),
            SizedBox(
              height: 25,
            ),
            Textfield().text(service_detai, TextStyles.mb18),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    service_img,
                    height: size.height * 0.13,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Textfield().text("Change Tyre", TextStyles.mb18),
                    SizedBox(
                      height: 10,
                    ),
                    Textfield().text("Honda Amaze", TextStyles.mn14),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textfield().text("30 April,2022", TextStyles.mb14),
                          Textfield().text("011:00 AM", TextStyles.mb14),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Spacer(),
            widget.dropdown! && widget.status != complete
                ? Dropdown(
                    width: size.width * 0.9,
                    hinttxt: "vehicle_type",
                    style:
                        TextStyles.withColor(TextStyles.mb14, color.btncolor3),
                    list: ["Ongoing", "Completed", in_progess, "Not started"],
                    current_value: currentvalue,
                    border_color: color.btncolor3,
                    height: 52,
                    Textalignment: AlignmentDirectional.center,
                  )
                : Container(),
            widget.dropdown! == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButtons(
                        active: true,
                        colorbtn: color.white,
                        width: 0.42,
                        style: TextStyles.withColor(
                          TextStyles.mb16,
                          color.Primary_second_Color,
                        ),
                        name: reject,
                        onTap: () {},
                      ),
                      ElevatedButtons(
                        width: 0.42,
                        style: TextStyles.mb16,
                        name: accept,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => ConfirmationDialog(
                                    destextwidth: 0.8,
                                    btntxt: view_booking_btn_txt,
                                    destxt: viewbookingmsg,
                                    onTap: () {
                                      nextScreen(context, My_Booking());
                                    },
                                  ));
                        },
                      ),
                    ],
                  )
                : Container(),
            widget.status == complete
                ? ElevatedButtons(name: complete)
                : Container()
          ],
        ),
      ),
    );
  }
}
