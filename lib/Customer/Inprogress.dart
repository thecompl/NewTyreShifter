import 'package:flutter/material.dart';
import 'package:tyreshifter/Customer/Service_Detail.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Widget/Customer_Req_Card.dart';
import '../config/string.dart';
import 'Immediate_service_detail.dart';

class Inprogress extends StatefulWidget {
  Inprogress({Key? key}) : super(key: key);

  @override
  State<Inprogress> createState() => _InprogressState();
}

class _InprogressState extends State<Inprogress> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Customer_Req_Card(
              adddress: '752 Longbranch St.Calhoun, GA 30701',
              headtxt: 'Summer times',
              Img: service_img,
              btnname: cancel_req + " (23:59 hour)",
              Ontap: () {
                nextScreen(context, Immediate_service_detail());
              },
            );
          }),
    );
  }
}
