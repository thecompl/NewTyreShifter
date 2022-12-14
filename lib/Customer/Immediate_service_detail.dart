import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/Widget/SupplierList_widget.dart';
import 'package:tyreshifter/config/Color.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Assistance_immediately_Cart.dart';
import '../Widget/Button.dart';
import '../Widget/ConfirmationDialog.dart';
import '../Widget/Cutome_Radiobtn.dart';
import '../Widget/Textfield.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Dialogs/Sent_request.dart';
import 'Dialogs/review_dialog.dart';
import '../Widget/Extension.dart';

class Immediate_service_detail extends StatefulWidget {
  final orderstatus;
  final status;
  final service_immidiate;

  Immediate_service_detail(
      {Key? key, this.orderstatus, this.status, this.service_immidiate = 0})
      : super(key: key);

  @override
  State<Immediate_service_detail> createState() =>
      _Immediate_service_detailState();
}

class _Immediate_service_detailState extends State<Immediate_service_detail> {
  String? suppiername;

  var radiobtn = 0;
  @override
  void initState() {
    print("status" + widget.orderstatus.toString());
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
          elevation: 2.0,
        ),
      ),
      // Appbartext().appbar(
      //     detail, TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.orderstatus == canceled
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Textfield().text(anothersupplier, TextStyles.mb18),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 110,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 2,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: size.width * 0.8,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      child: SupplierList_widget(
                                        adddress:
                                            '752 Longbranch St.Calhoun, GA 30701',
                                        headtxt: 'Summer times',
                                        Img: service_img,
                                        supplier: CustomRadio(
                                          groupValue: index,
                                          onChanged: (int) {
                                            print("hiii" + int.toString());
                                            setState(() {
                                              index = int;
                                            });
                                          },
                                          value: index,
                                        ),
                                        Ontap: () {
                                          // nextScreen(
                                          //     context,
                                          //     Immediate_service_detail(
                                          //       orderstatus: completed,
                                          //     ));
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Textfield().text("Summer times", TextStyles.mb18),
                              if (widget.service_immidiate == 1)
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Image.asset(staricon,
                                          height: size.height * 0.04),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Textfield().text(
                                          "4.5",
                                          TextStyles.withColor(TextStyles.mn16,
                                              color.textgrey_color))
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 30,
                                    // decoration: BoxDecoration(
                                    //     border:
                                    //         Border.all(color: color.black)),
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: color.Primary_second_Color,
                                      size: 25,
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.5,
                                    child: Textfield().text(
                                        "345, abc socity pandesara surat",
                                        TextStyles.withColor(TextStyles.mn16,
                                            color.textgrey_color),
                                        TextAlign.left,
                                        TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 30,
                                        child: Image.asset(tryeicon_img)),
                                    Textfield().text(
                                      "£840",
                                      TextStyles.withColor(TextStyles.mb16,
                                          color.Primary_second_Color),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          widget.service_immidiate == 0
                              ? widget.orderstatus == completed
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: color.skylight,
                                      ),
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(staricon,
                                                    height: size.height * 0.04),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Textfield().text(
                                                    "4.5",
                                                    TextStyles.withColor(
                                                        TextStyles.mn16,
                                                        color.textgrey_color))
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(kmicon,
                                                    height: size.height * 0.04),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Textfield().text(
                                                    "5 KM", TextStyles.mb16)
                                              ],
                                            ),
                                          ]))
                                  : widget.orderstatus != 'pending'
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: color.skylight,
                                          ),
                                          padding: EdgeInsets.all(15),
                                          child: Row(children: [
                                            Row(
                                              children: [
                                                Image.asset(staricon,
                                                    height: size.height * 0.04),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Textfield().text(
                                                    "4.5",
                                                    TextStyles.withColor(
                                                        TextStyles.mn16,
                                                        color.textgrey_color))
                                              ],
                                            ),
                                            SizedBox(width: 20),
                                            Textfield().text(
                                                "Good Review",
                                                TextStyles.withColor(
                                                    TextStyles.mb16,
                                                    color.txt_dark_blue_color))
                                          ]))
                                      : Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: color.skylight,
                                          ),
                                          padding: EdgeInsets.all(15),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(staricon,
                                                        height:
                                                            size.height * 0.04),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Textfield().text(
                                                        "4.5",
                                                        TextStyles.withColor(
                                                            TextStyles.mn16,
                                                            color
                                                                .textgrey_color))
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(kmicon,
                                                        height:
                                                            size.height * 0.04),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Textfield().text(
                                                        "5 KM", TextStyles.mb16)
                                                  ],
                                                ),
                                              ]))
                              : widget.orderstatus != completed
                                  ? Container(
                                      alignment: Alignment.center,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                          color: widget.orderstatus == "pending"
                                              ? color.pending_status_color
                                              : widget.orderstatus == "accepted"
                                                  ? color.accepted_status_color
                                                  : widget.orderstatus ==
                                                          "in-route"
                                                      ? color
                                                          .in_route_status_color
                                                      : color.skylight,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height: 60,
                                      child: Textfield().text(
                                          widget.orderstatus
                                              .toString()
                                              .capitalize(),
                                          TextStyles.withColor(
                                            TextStyles.mb20,
                                            widget.orderstatus == "pending"
                                                ? color.pending_status_txt_color
                                                : widget.orderstatus ==
                                                        "accepted"
                                                    ? color
                                                        .accepted_status_txt_color
                                                    : widget.orderstatus ==
                                                            "in-route"
                                                        ? color
                                                            .in_route_status_txt_color
                                                        : color.skylight,
                                          )))
                                  : Container(),
                          if (widget.service_immidiate != 1 &&
                              widget.orderstatus != completed)
                            SizedBox(
                              height: 25,
                            ),
                        ]),
              if (widget.service_immidiate == 1 &&
                  widget.orderstatus != completed)
                SizedBox(
                  height: 15,
                ),
              Textfield().text(service_detai, TextStyles.mb18),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      service_img,
                      height: size.height * .12,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textfield().text(
                            "Tyre Replacement (New tyre)", TextStyles.mb18),
                        SizedBox(
                          height: 5,
                        ),
                        Textfield().text("Honda Amaze", TextStyles.mn15),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: size.width * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Textfield()
                                  .text("30 April,2022", TextStyles.mb14),
                              Textfield().text("011:00 AM", TextStyles.mb14),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              if (widget.service_immidiate == 0)
                SizedBox(
                  height: 20,
                ),
              if (widget.service_immidiate == 0)
                Textfield().text(
                    midrange,
                    TextStyles.withColor(
                        TextStyles.mb21, color.Primary_second_Color)),
              SizedBox(
                height: 10,
              ),
              widget.service_immidiate == 1
                  ? Container()
                  : Container(
                      // elevation: 0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: color.border_grey4_color, width: 0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
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
              SizedBox(
                height: 20,
              ),
              widget.orderstatus == canceled
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Textfield().text("Summer times", TextStyles.mb18),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 30,
                                    // decoration: BoxDecoration(
                                    //     border:
                                    //         Border.all(color: color.black)),
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: color.Primary_second_Color,
                                      size: 25,
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.5,
                                    child: Textfield().text(
                                        "345, abc socity pandesara surat",
                                        TextStyles.withColor(TextStyles.mn16,
                                            color.textgrey_color),
                                        TextAlign.left,
                                        TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 30,
                                        child: Image.asset(tryeicon_img)),
                                    Textfield().text(
                                      "£840",
                                      TextStyles.withColor(TextStyles.mb16,
                                          color.Primary_second_Color),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: color.skylight,
                              ),
                              padding: EdgeInsets.all(15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(staricon,
                                            height: size.height * 0.04),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Textfield().text(
                                            "4.5",
                                            TextStyles.withColor(
                                                TextStyles.mn16,
                                                color.textgrey_color))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(kmicon,
                                            height: size.height * 0.04),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Textfield()
                                            .text("5 KM", TextStyles.mb16)
                                      ],
                                    ),
                                  ])),
                          SizedBox(
                            height: 25,
                          ),
                        ])
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Textfield().text(payment_details, TextStyles.mb18),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Textfield().text(
                                  "Tansaction ID",
                                  TextStyles.withColor(
                                      TextStyles.mn18, color.text_grey2_color)),
                              Textfield().text(
                                  "02568975",
                                  TextStyles.withColor(
                                      TextStyles.mb18, color.text_grey2_color)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Textfield().text(
                                  "Paid Via",
                                  TextStyles.withColor(
                                      TextStyles.mn18, color.text_grey2_color)),
                              Textfield().text(
                                  "Credit Card",
                                  TextStyles.withColor(
                                      TextStyles.mb18, color.text_grey2_color)),
                            ],
                          ),
                          SizedBox(
                            height: widget.service_immidiate == 1 ? 20 : 10,
                          ),
                          if (widget.service_immidiate == 1)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Textfield().text(paymen_rec, TextStyles.mb18),
                                Image.asset(
                                  pdf,
                                  height: size.height * 0.07,
                                )
                              ],
                            ),
                          if (widget.service_immidiate == 0 &&
                              widget.orderstatus == completed)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Textfield().text(paymen_rec, TextStyles.mb18),
                                Image.asset(
                                  pdf,
                                  height: size.height * 0.07,
                                )
                              ],
                            ),
                        ]),
              SizedBox(
                height: 20,
              ),
              if (widget.service_immidiate == 0)
                ElevatedButtons(
                  width: 0.95,
                  name: widget.orderstatus == completed
                      ? give_review
                      : widget.orderstatus == canceled
                          ? bookagain
                          : widget.orderstatus == "accepted" ||
                                  widget.orderstatus == "in-route"
                              ? tracktxt
                              : widget.orderstatus == "pending"
                                  ? modifyorder
                                  : "null",
                  onTap: () {
                    widget.orderstatus == completed
                        ? showDialog(
                            context: context,
                            builder: (context) => ReviewPopUp())
                        : widget.orderstatus == canceled
                            ? ''
                            : '';
                  },
                )
              else
                widget.orderstatus == 'pending'
                    ? ElevatedButtons(
                        width: 0.95,
                        name: widget.orderstatus == completed
                            ? give_review
                            : widget.orderstatus == canceled
                                ? bookagain
                                : widget.orderstatus == "accepted" ||
                                        widget.orderstatus == "in-route"
                                    ? tracktxt
                                    : widget.orderstatus == "pending"
                                        ? modifyorder
                                        : "null",
                        onTap: () {
                          widget.orderstatus == completed
                              ? showDialog(
                                  context: context,
                                  builder: (context) => ReviewPopUp())
                              : widget.orderstatus == canceled
                                  ? ''
                                  : '';
                        },
                      )
                    : Container()
            ],
          ),
        ),
      ),
    );
  }
}
