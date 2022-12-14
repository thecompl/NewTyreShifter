import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:tyreshifter/Customer/Cancelledrequest.dart';
import 'package:tyreshifter/Customer/Completed.dart';
import 'package:tyreshifter/Customer/Inprogress.dart';

import 'package:tyreshifter/config/Color.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../Widget/Customer_Req_Card.dart';
import '../Widget/Textfield.dart';
import '../Widget/Toggle.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Dialogs/Cancel_req_dialog.dart';
import 'Immediate_service_detail.dart';

class Completed_Order extends StatefulWidget {
  Completed_Order({Key? key}) : super(key: key);

  @override
  State<Completed_Order> createState() => _Completed_OrderState();
}

class _Completed_OrderState extends State<Completed_Order> {
  // var _tabTextIndexSelected = 1;
  var _listTextTabToggle = [in_progess, completed, canceled];
  int index = 1;
  PageController? _pageController;

  List pages = [Inprogress(), Completed(), Cancelledrequest()];
  void initState() {
    _pageController = PageController(initialPage: index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: color.skylight,
        appBar: PreferredSize(
          preferredSize: Platform.isAndroid
              ? Size.fromHeight(appbarheight_android)
              : Size.fromHeight(appbarheight_ios),
          child: Appbartext(title: completed_bookings),
        ),
        // Appbartext().appbar(
        //     my_req, TextStyles.withColor(TextStyles.mb16, color.black), context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: size.height,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Customer_Req_Card(
                    adddress: '752 Longbranch St.Calhoun, GA 30701',
                    headtxt: 'Summer times',
                    Img: service_img,
                    btnname: cancel_req + "(23:59 hour)",
                    Ontap: () {
                      nextScreen(
                          context,
                          Immediate_service_detail(
                            orderstatus: completed,
                          ));
                    },
                  );
                }),
          ),
        ));
  }

//   toggle() {
//     return Center(
//       child: FlutterToggleTab(
// // width in percent
//         width: 90,
//         borderRadius: 10,
//         height: 60,
//         marginSelected: EdgeInsets.all(5),
//         selectedIndex: _tabTextIndexSelected,
//         selectedBackgroundColors: [
//           color.Primary_second_Color,
//         ],
//         unSelectedBackgroundColors: [Colors.white, Colors.white],
//         selectedTextStyle: TextStyles.withColor(TextStyles.mb16, color.white),
//         unSelectedTextStyle:
//             TextStyles.withColor(TextStyles.mb16, color.Primary_second_Color),
//         labels: _listTextTabToggle,
//         selectedLabelIndex: (index) {
//           setState(() {
//             _tabTextIndexSelected = index;
//           });
//         },
//         isScroll: true,
//       ),
//     );
//   }

  // my_req_card(cntx) {
  //   var size = MediaQuery.of(cntx).size;
  //   return GestureDetector(
  //     onTap: () {
  //       nextScreen(cntx, Immediate_service_detail());
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.only(bottom: 10),
  //       child: Card(
  //         shape: RoundedRectangleBorder(
  //           side: BorderSide(color: Colors.white70, width: 1),
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         child: Column(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(15),
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Column(
  //                         children: [
  //                           Image.asset(
  //                             service_img,
  //                             height: size.height * 0.1,
  //                             width: size.width * 0.2,
  //                           ),
  //                           Container(),
  //                         ],
  //                       ),
  //                       SizedBox(
  //                         width: 20,
  //                       ),
  //                       Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Textfield().text("Summer times", TextStyles.mb16),
  //                           SizedBox(height: 10),
  //                           Row(
  //                             children: [
  //                               Padding(
  //                                 padding: const EdgeInsets.only(
  //                                     right: 5, bottom: 5),
  //                                 child: Icon(
  //                                   Icons.location_on_outlined,
  //                                   color: color.Primary_second_Color,
  //                                 ),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 10),
  //                                 child: Container(
  //                                   width: size.width * 0.5,
  //                                   child: Textfield().text(
  //                                       "752 Longbranch St.Calhoun, GA 30701",
  //                                       TextStyles.withColor(TextStyles.mn16,
  //                                           color.textgrey_color)),
  //                                 ),
  //                               )
  //                             ],
  //                           ),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(top: 10),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: [
  //                         Container(),
  //                         Row(
  //                           children: [
  //                             Padding(
  //                               padding: const EdgeInsets.only(right: 5),
  //                               child: Image.asset(tryeicon_img),
  //                             ),
  //                             Textfield().text(
  //                                 "kr840",
  //                                 TextStyles.withColor(TextStyles.mb16,
  //                                     color.Primary_second_Color))
  //                           ],
  //                         ),
  //                         Textfield().text("30 April,2022", TextStyles.mb14)
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Container(
  //               padding: EdgeInsets.only(left: 10, right: 10),
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
  //                 padding: EdgeInsets.all(15),
  //                 child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Row(
  //                         children: [
  //                           Image.asset(staricon, height: size.height * 0.04),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Textfield().text(
  //                               "4.5",
  //                               TextStyles.withColor(
  //                                   TextStyles.mn16, color.textgrey_color))
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           Image.asset(kmicon, height: size.height * 0.04),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Textfield().text("5 KM", TextStyles.mb16)
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           Image.asset(msg_icon, height: size.height * 0.04),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Textfield().text(
  //                               msg,
  //                               TextStyles.withColor(
  //                                   TextStyles.mn16, color.textgrey_color))
  //                         ],
  //                       ),
  //                     ])),
  //             _tabTextIndexSelected == 1
  //                 ? Padding(
  //                     padding: const EdgeInsets.all(15),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         ElevatedButton_myreq(
  //                             repeat_order,
  //                             cntx,
  //                             null,
  //                             size.width * 0.3,
  //                             TextStyles.withColor(
  //                                 TextStyles.mb14, color.white),
  //                             color.Primary_second_Color),
  //                         ElevatedButton_myreq(
  //                             repeat_order,
  //                             cntx,
  //                             null,
  //                             size.width * 0.5,
  //                             TextStyles.withColor(
  //                                 TextStyles.mb14, color.white),
  //                             color.btncolor2)
  //                       ],
  //                     ),
  //                   )
  //                 : Padding(
  //                     padding: const EdgeInsets.all(15),
  //                     child: ElevatedButton_myreq(
  //                         cancel_req + " (23:59 hour)",
  //                         cntx,
  //                         null,
  //                         size.width,
  //                         TextStyles.withColor(TextStyles.mb14, color.white),
  //                         color.disable_color))
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // ElevatedButton_myreq(btn_name, cntx, call, _width, style, btncolor) {
  //   var size = MediaQuery.of(context).size;
  //   return SizedBox(
  //     width: _width,
  //     child: ElevatedButton(
  //       child: Text(btn_name),
  //       onPressed: () {
  //         showDialog(context: cntx, builder: (cntx) => Cancel_req_dialog());
  //       },
  //       style: ElevatedButton.styleFrom(
  //           elevation: 0,
  //           shape: new RoundedRectangleBorder(
  //             borderRadius: new BorderRadius.circular(10),
  //           ),
  //           primary: btncolor,
  //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
  //           textStyle: style),
  //     ),
  //   );
  // }

}
