import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/Customer/Dialogs/Sent_request.dart';

import 'package:tyreshifter/Widget/ConfirmationDialog.dart';
import 'package:tyreshifter/config/Color.dart';
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

class OrderDetail extends StatefulWidget {
  final status;

  OrderDetail({
    Key? key,
    this.status,
  }) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  var currentvalue;
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
          title: detail,
          show_arrow_icon: 0,
          elevation: 1.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(service_img,
                                fit: BoxFit.cover)), //Text
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
                  GestureDetector(child: SvgPicture.string(cancelordersvg))
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
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Textfield().text(
                    //         completed_orders,
                    //         TextStyles.withColor(
                    //             TextStyles.mb16, color.txt_dark_blue_color)),
                    //     Textfield().text(
                    //         "10",
                    //         TextStyles.withColor(
                    //             TextStyles.mn14, color.textgrey_color)),
                    //   ],
                    // )
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
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                ],
              ),
              if (widget.status == notstart)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Textfield().text(
                        midrange,
                        TextStyles.withColor(
                            TextStyles.mb18, color.Primary_second_Color)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // elevation: 0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: color.border_grey4_color, width: 0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Assistance_immediately_Cart(
                          adddress: "Per tyre, fitted.",
                          price: "£139.23",
                          headtxt: 'UNIROYAL 255 35 R19 96Y RAINSPORT 5',
                          Img: tyre_img,
                          btnname: working,
                          btncolor: color.btncolor3,
                          quantity: '1',
                          height: 125,
                          Ontap: () {
                            // nextScreen(
                            //     context,
                            //     Assistance_tyreListDetail(
                            //         // dropdown: true,
                            //         // pagetype: booking_details,
                            //         // status: working
                            //         ));
                          },
                          Ontapdelete: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButtons(
                // width: 0.42,
                height: 55,
                style: TextStyles.mb16,
                name: startWorking,
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
          ),
        ),
      ),
    );
  }
}
