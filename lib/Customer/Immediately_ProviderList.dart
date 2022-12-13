import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tyreshifter/Common/MessageScreen.dart';
import 'package:tyreshifter/Customer/Assistance_tyreList.dart';
import 'package:tyreshifter/Customer/ProductList.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Widget/Customer_Req_Card.dart';
import '../config/string.dart';
import 'Dialogs/Cancel_req_dialog.dart';
import 'Immediate_service_detail.dart';

class Immediately_ProviderList extends StatefulWidget {
  final type;
  Immediately_ProviderList({Key? key, this.type}) : super(key: key);

  @override
  State<Immediately_ProviderList> createState() =>
      _Immediately_ProviderListState();
}

class _Immediately_ProviderListState extends State<Immediately_ProviderList> {
  @override
  Widget build(BuildContext context) {
    log("type" + widget.type.toString());
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
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
                showdate: false,
                msg: false,
                track: true, //it will true before 1 hours
                showbottom: true,
                Ontap: () {
                  nextScreen(
                      context,
                      Assistance_tyreList(
                        type: widget.type,
                      ));
                },
              );
            }),
      ),
    );
  }
}
