import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:tyreshifter/Customer/Cancelledrequest.dart';
import 'package:tyreshifter/Customer/Completed.dart';
import 'package:tyreshifter/Customer/Immediately_ProviderList.dart';
import 'package:tyreshifter/Customer/Inprogress.dart';

import 'package:tyreshifter/config/Color.dart';

import '../../Widget/Appbartext.dart';
import '../../Widget/Button.dart';
import '../../Widget/Customer_Req_Card.dart';
import '../../Widget/Statuswidget.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/Toggle.dart';
import '../../config/Navagate_Next.dart';
import '../../config/TextStyles/Textstyles.dart';
import '../../config/string.dart';
import '../Assistance_tyreList.dart';
import './../Dialogs/Cancel_req_dialog.dart';
import '../Immediate_service_detail.dart';

class Orders extends StatefulWidget {
  final type;
  Orders({Key? key, this.type}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  void initState() {
    // log("providerlisttype"+ widget.type.toString());
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
          child: Appbartext(title: immediatelyRequest),
        ),
        // Appbartext().appbar(
        //     my_req, TextStyles.withColor(TextStyles.mb16, color.black), context),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                    showbtn: false,
                    btntype: false,
                    msg: false,
                    track: true, //it will true before 1 hours
                    showbottom: true,
                    status: true,
                    status_name: index == 0
                        ? "Pending"
                        : index == 1
                            ? "Accepted"
                            : index == 2
                                ? completed
                                : "In-route",
                    statusbgcolor: index == 0
                        ? color.pending_status_color
                        : index == 1
                            ? color.accepted_status_color
                            : index == 2
                                ? color.completed_status_color
                                : color.in_route_status_color,
                    statustxtcolor: index == 0
                        ? color.pending_status_txt_color
                        : index == 1
                            ? color.accepted_status_txt_color
                            : index == 2
                                ? color.completed_status_txt_color
                                : color.in_route_status_txt_color,
                    showdate: false,
                    Ontap: () {
                      nextScreen(
                          context,
                          Immediate_service_detail(
                            service_immidiate: 1,
                            orderstatus: index == 0
                                ? "pending"
                                : index == 1
                                    ? "accepted"
                                    : index == 2
                                        ? completed
                                        : "in-route",
                          ));
                    },
                  );
                }),
          ),
        ));
  }
}
