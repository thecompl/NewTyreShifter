import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:tyreshifter/Customer/Immediate_Request.dart';
import 'package:tyreshifter/Suppliers/Latest_req.dart';
import 'package:tyreshifter/Suppliers/My_Booking.dart';
import 'package:tyreshifter/Widget/Booking_Card.dart';
import 'package:tyreshifter/Widget/Toggle.dart';

import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/config/string.dart';

import '../../Widget/Appbartext.dart';
import '../../Widget/BottomBar.dart';
import '../../Widget/Textfield.dart';
import '../../config/Navagate_Next.dart';
import '../Immidiate_req.dart';
import '../../Common/NotificationScreen.dart';
import '../Service_Detail.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List pages = [Latest_req(), Immedite_req()];
  bool need_tyre = false;
  bool resever_tyre = false;
  int index = 0;
  PageController? _pageController;
  void initState() {
    _pageController = PageController(initialPage: index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.skylight,
      appBar:
      PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: immediate_req,show_arrow_icon: 1)),
          //home screen app bar

      // PreferredSize(
      //   preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
      //   child: Appbartext(title: home,show_arrow_icon: 1, show_icon: 1,icon: Icons.notifications,ontap: (){
      //     nextScreen(context, NotificationScreen());
      //   },),),

      // Appbartext().appbar(
      //     home,
      //     TextStyles.withColor(TextStyles.mb16, color.black),
      //     context,1,1.0,Icons.notifications),
      //
      // AppBar(
      //   elevation: 1,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: color.white,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Container(),
      //       Textfield().text(
      //           home,
      //           TextStyles.withColor(
      //               TextStyles.mb16, color.text_grey2_color)),
      //       GestureDetector(
      //         onTap: () {
      //           nextScreen(context, NotificationScreen());
      //         },
      //         child: Icon(
      //           Icons.notifications,
      //           color: Colors.black,
      //           size: 30,
      //         ),
      //       )
      //     ],
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                height: 60,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pageController!.jumpToPage(0);
                            index = 0;
                          });
                        },
                        child: Togglebtn(
                            txt: request,
                            style: TextStyles.withColor(TextStyles.mb16,
                                index == 0 ? color.white : color.black),
                            active: index == 0 ? true : false,
                            width: 0.4),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pageController!.jumpToPage(1);
                            index = 1;
                          });
                        },
                        child: Togglebtn(
                          txt: immediate_req,
                          style: TextStyles.withColor(TextStyles.mb16,
                              index == 1 ? color.white : color.black),
                          active: index == 1 ? true : false,
                          width: 0.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: size.height * 0.71,
                  child: PageView.builder(

                    onPageChanged: (value) {
                      setState(() {
                        index = value;
                      });
                    },
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return pages[index];
                    },
                    itemCount: pages.length, // Can be null
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // toggle() {
  //   var size = MediaQuery.of(context).size;
  //   return Center(
  //     child: FlutterToggleTab(
  //       width: size.width * 0.27,
  //       borderRadius: 5,
  //       height: 50,
  //       marginSelected: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  //       selectedIndex: _tabTextIndexSelected,
  //       selectedBackgroundColors: [
  //         color.Primary_second_Color,
  //       ],
  //       unSelectedBackgroundColors: [Colors.white, Colors.white],
  //       selectedTextStyle: TextStyles.withColor(TextStyles.mb16, color.white),
  //       unSelectedTextStyle: TextStyles.withColor(TextStyles.mb16, color.black),
  //       labels: _listTextTabToggle,
  //       selectedLabelIndex: (index) {
  //         setState(() {
  //           _tabTextIndexSelected = index;
  //         });
  //       },
  //       isScroll: false,
  //     ),
  //   );
  // }

  my_req_card(cntx) {
    var size = MediaQuery.of(cntx).size;
    return GestureDetector(
      onTap: () {
        nextScreen(
            cntx,
            Service_Details(
              dropdown: false,
              pagetype: details,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(service_img,
                                      fit: BoxFit.cover)), //Text
                            ),
                            Container(),
                          ],
                        ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textfield().text("Summer times", TextStyles.mb16),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5, bottom: 5),
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
                                        TextStyles.withColor(TextStyles.mn16,
                                            color.textgrey_color)),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Textfield().text(
                                    change_tyre,
                                    TextStyles.withColor(TextStyles.mb14,
                                        color.Primary_second_Color)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
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
                        Textfield().text(
                            "30 April 2022 06:37 PM",
                            TextStyles.withColor(
                                TextStyles.mb16, color.txt_dark_color)),
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
            ],
          ),
        ),
      ),
    );
  }

  // ElevatedButton_myreq(btn_name, cntx, call, _width, style, btncolor) {
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
  //             borderRadius: new BorderRadius.circular(10),
  //           ),
  //           primary: btncolor,
  //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
  //           textStyle: style),
  //     ),
  //   );
  // }

}
