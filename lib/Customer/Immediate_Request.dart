import 'dart:io';

import 'package:flutter/material.dart';

import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Customer_Req_Card.dart';
import '../Widget/Textfield.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Immediate_service_detail.dart';

class Immediate_Request extends StatefulWidget {
  Immediate_Request({Key? key}) : super(key: key);

  @override
  State<Immediate_Request> createState() => _Immediate_RequestState();
}

class _Immediate_RequestState extends State<Immediate_Request> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: color.skylight,
        appBar:PreferredSize(
          preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android + 40):Size.fromHeight(appbarheight_ios+40),
          child: Appbartext(title: booking,show_arrow_icon: 1,showbottom: true,)),
        // Appbartext().appbar(immediate_req,
        //     TextStyles.withColor(TextStyles.mb16, color.black), context, 1),
        body:TabBarView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Customer_Req_Card(
                      adddress: '752 Longbranch St.Calhoun, GA 30701',
                      headtxt: 'Summer times',
                      Img: service_img,
                      btnname: cancel_req + " (23:59 hour)",
                      showbtn: false,
                      msg: false,
                      Ontap: () {
                        nextScreen(context, Immediate_service_detail());
                      },
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Customer_Req_Card(
                      adddress: '752 Longbranch St.Calhoun, GA 30701',
                      headtxt: 'Summer times',
                      Img: service_img,
                      btnname: cancel_req + " (23:59 hour)",
                      showbtn: false,
                      msg: false,
                      Ontap: () {
                        nextScreen(context, Immediate_service_detail());
                      },
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Customer_Req_Card(
                      adddress: '752 Longbranch St.Calhoun, GA 30701',
                      headtxt: 'Summer times',
                      Img: service_img,
                      btnname: cancel_req + " (23:59 hour)",
                      showbtn: false,
                      msg: false,
                      Ontap: () {
                        nextScreen(context, Immediate_service_detail());
                      },
                    );
                  }),
            ),

          ],
        )),
    );



  }
}
