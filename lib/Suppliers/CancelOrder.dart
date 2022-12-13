import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/Customer/Dialogs/Sent_request.dart';
import 'package:tyreshifter/Suppliers/Dailogs/CancelBookingdailog.dart';

import 'package:tyreshifter/Widget/ConfirmationDialog.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/getx/controller.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Assistance_immediately_Cart.dart';
import '../Widget/Button.dart';
import '../Widget/Dropdown.dart';
import '../Widget/Textfield.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Complete_Order.dart';
import 'My_Booking.dart';

class CancelOrder extends StatefulWidget {
  final ordernumber;

  CancelOrder({
    Key? key,
    this.ordernumber,
  }) : super(key: key);

  @override
  State<CancelOrder> createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {
  var checkedValue = false;
  var checkedValue1 = false;
  // DataController dcx = Get.put(DataController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(
          title: order + '#' + widget.ordernumber,
          show_arrow_icon: 0,
          elevation: 1.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Textfield().text(
                  reasonforcancel,
                  TextStyles.withColor(
                      TextStyles.mb16, color.txt_dark_blue_color)),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (() {
                  setState(() {
                    checkedValue = !checkedValue;
                  });
                }),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            activeColor: color.Primary_second_Color,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                  width: 1.0, color: color.border_grey3_color),
                            ),
                            value: checkedValue,
                            onChanged: (value) {
                              setState(() {
                                value = !value!;
                                checkedValue = !checkedValue;
                              });
                            }),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Textfield().text(
                          "Lorem ipsum duumy text just reason",
                          TextStyles.withColor(
                              TextStyles.mn16, color.txt_dark_blue_color, 1.2),
                          TextAlign.left,
                          TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (() {
                  setState(() {
                    checkedValue1 = !checkedValue1;
                  });
                }),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            activeColor: color.Primary_second_Color,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                  width: 1.0, color: color.border_grey3_color),
                            ),
                            value: checkedValue1,
                            onChanged: (value) {
                              setState(() {
                                checkedValue1 = value!;
                              });
                            }),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Textfield().text(
                          "Lorem ipsum duumy text just reason",
                          TextStyles.withColor(
                              TextStyles.mn16, color.txt_dark_blue_color, 1.2)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: color.border_grey_color),
                    borderRadius: BorderRadius.circular(15)),
                // height: size.height * 0.2,
                width: size.width * 0.9,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      maxLines: 5,
                      keyboardType: TextInputType.text,
                      // controller: dcx.aboutUs,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                          hintStyle: TextStyles.mn14),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButtons(
                // width: 0.42,
                height: 55,
                style: TextStyles.mb16,
                name: submit,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => CancelBookingdailog(
                            title: cancelBooking,
                            msg: cancelmsg1,
                            msg1: cancelmsg2,
                            cancellabel: cancel,
                            confirmlabel: confirm,
                            Oncanceltap: () {
                              backScreen(context);
                            },
                            Onconfirmtap: () {
                              backScreen(context);
                            },
                          ));
                },
              )
            ])),
      ),
    );
  }
}
