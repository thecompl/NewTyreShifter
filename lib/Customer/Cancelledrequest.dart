import 'package:flutter/material.dart';
import 'package:tyreshifter/Common/MessageScreen.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Widget/Customer_Req_Card.dart';
import '../config/string.dart';
import 'Immediate_service_detail.dart';

class Cancelledrequest extends StatefulWidget {
  Cancelledrequest({Key? key}) : super(key: key);

  @override
  State<Cancelledrequest> createState() => _CancelledrequestState();
}

class _CancelledrequestState extends State<Cancelledrequest> {
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
              // btntype: true,
              btnname: canceled,
              ontapmsg: () => {nextScreen(context, MessageScreen())},
              Ontap: () {
                nextScreen(context, Immediate_service_detail(
                  orderstatus: canceled,
                 ));
              },
              color:color.disable_color,
            );
          }),
    );
  }
}
