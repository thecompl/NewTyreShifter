import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:intl/intl.dart';
import 'package:tyreshifter/Common/NotificationScreen.dart';
import 'package:tyreshifter/Suppliers/Booking_Details.dart';

import 'package:tyreshifter/Suppliers/Service_Detail.dart';
import 'package:tyreshifter/Widget/Button.dart';

import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/config/string.dart';

import '../../Widget/BottomBar.dart';
import '../../Widget/Textfield.dart';
import '../../config/Navagate_Next.dart';
import '../Common/CalenderScreen.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Booking_Card.dart';

class My_Booking extends StatefulWidget {
  final String? appbarname;
  final showarrow;
  My_Booking({Key? key, this.appbarname = "Home", this.showarrow = 0})
      : super(key: key);

  @override
  State<My_Booking> createState() => _My_BookingState();
}

class _My_BookingState extends State<My_Booking> {
  bool need_tyre = false;
  bool resever_tyre = false;
  var btn_change = false;
  DateTime? pickedDate = DateTime.now();
  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(
          title: widget.appbarname!,
          show_arrow_icon: widget.showarrow == 1 ? 0 : 1,
          show_icon: widget.showarrow == 1 ? 0 : 1,
          icon: Icons.notifications,
          ontap: () {
            nextScreen(context, NotificationScreen());
          },
        ),
      ),

      //my booking appp --------

      // PreferredSize(
      //   preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
      //   child: Appbartext(title: my_booking,show_arrow_icon: 0,),),

      // Appbartext().appbar(
      //     my_booking,
      //     TextStyles.withColor(TextStyles.mb16, color.black),
      //     context,1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5, left: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Textfield().text(today, TextStyles.mb16),
                    GestureDetector(
                        onTap: () {
                          nextScreen(context, HomeCalendarPage());
                          // opendatepiker();
                          // setState(() {
                          //   date.text = DateFormat('dd/MM/yyyy')
                          //       .format(pickedDate!)
                          //       .toString();
                          // });
                        },
                        child: SvgPicture.string(calendarsvg)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: size.height,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      if (index % 2 == 0) {
                        return Booking_Card(
                          adddress: "752 Longbranch St.Calhoun, GA 30701",
                          headtxt: 'Jaylon Rosser',
                          Img: service_img,
                          btnname: working,
                          btncolor: color.btncolor3,
                          Ontap: () {
                            nextScreen(
                                context,
                                Service_Details(
                                    dropdown: true,
                                    pagetype: booking_details,
                                    status: working));
                          },
                        );
                      }
                      return Booking_Card(
                        adddress: "752 Longbranch St.Calhoun, GA 30701",
                        headtxt: 'Jaylon Rosser',
                        Img: service_img,
                        btnname: complete,
                        btncolor: color.btncolor2,
                        Ontap: () {
                          nextScreen(
                              context,
                              Service_Details(
                                dropdown: true,
                                pagetype: booking_details,
                                status: complete,
                              ));
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  opendatepiker() async {
    DateTime? tmpdate = await showDatePicker(
        context: context, //context of current state
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));
    setState(() {
      pickedDate = tmpdate;
    });
  }
// }
  // my_req_card(cntx, value) {
  //   var size = MediaQuery.of(cntx).size;
  //   return GestureDetector(
  //     onTap: () {
  //       nextScreen(cntx, Booking_Details());
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.only(bottom: 10),
  //       child: Card(
  //         shape: RoundedRectangleBorder(
  //           side: BorderSide(color: Colors.white70, width: 1),
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(15),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       CircleAvatar(
  //                         radius: 30,
  //                         child: ClipRRect(
  //                             borderRadius: BorderRadius.circular(50),
  //                             child: Image.asset(service_img,
  //                                 fit: BoxFit.cover)), //Text
  //                       ),
  //                       Expanded(
  //                         child: Container(
  //                           padding: EdgeInsets.only(left: 10),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Textfield()
  //                                       .text("Summer times", TextStyles.mb16),
  //                                   Container(
  //                                       height: 30,
  //                                       child: Image.asset(msg_icon))
  //                                 ],
  //                               ),
  //                               Row(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Icon(
  //                                     Icons.location_on_outlined,
  //                                     color: color.Primary_second_Color,
  //                                   ),
  //                                   Container(
  //                                     width: size.width * 0.5,
  //                                     child: Textfield().text(
  //                                         "752 Longbranch St.Calhoun, GA 30701",
  //                                         TextStyles.withColor(TextStyles.mn16,
  //                                             color.textgrey_color)),
  //                                   )
  //                                 ],
  //                               ),
  //                               Container(
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.only(top: 10),
  //                                   child: Textfield().text(
  //                                       change_tyre,
  //                                       TextStyles.withColor(TextStyles.mb14,
  //                                           color.Primary_second_Color)),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),

  //             Container(
  //               child: Image.asset(
  //                 divider,
  //                 width: size.width,
  //               ),
  //             ),
  //             Container(
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10),
  //                   // color: color.skylight,
  //                 ),
  //                 padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
  //                 child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Textfield().text(
  //                           "30 April 2022 06:37 PM",
  //                           TextStyles.withColor(
  //                               TextStyles.mb16, color.txt_dark_color)),
  //                       Row(
  //                         children: [
  //                           Image.asset(kmicon, height: size.height * 0.04),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Textfield().text("5 KM", TextStyles.mb16)
  //                         ],
  //                       ),
  //                     ])),

  //             ElevatedButtons(
  //               name: complete,
  //               width: 0.8,
  //               height: 40,
  //               colorbtn: color.btncolor2,
  //               style: TextStyles.mb14,
  //               borderRadius: 5,
  //             ),
  //             // Container(
  //             //   padding: EdgeInsets.symmetric(horizontal: 20),
  //             //   child: ElevatedButton_myreq(
  //             //       btn_change == value ? working : completed,
  //             //       cntx,
  //             //       size.width,
  //             //       TextStyles.mb14,
  //             //       btn_change == value ? color.btncolor3 : color.btncolor2),
  //             // ),
  //             SizedBox(
  //               height: 15,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // ElevatedButton_myreq(btn_name, cntx, _width, style, btncolor) {
  //   var size = MediaQuery.of(context).size;
  //   return SizedBox(
  //     width: _width,
  //     child: ElevatedButton(
  //       child: Text(btn_name),
  //       onPressed: () {
  //         // showDialog(context: cntx, builder: (cntx) => Cancel_req_dialog());
  //       },
  //       style: ElevatedButton.styleFrom(
  //           elevation: 0,
  //           shape: new RoundedRectangleBorder(
  //             borderRadius: new BorderRadius.circular(8),
  //           ),
  //           primary: btncolor,
  //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
  //           textStyle: style),
  //     ),
  //   );
  // }

}
