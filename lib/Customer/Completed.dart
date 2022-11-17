import 'package:flutter/material.dart';

import '../Widget/Customer_Req_Card.dart';
import '../config/string.dart';
import 'Dialogs/Cancel_req_dialog.dart';

class Completed extends StatefulWidget {
  Completed({Key? key}) : super(key: key);

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
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
              btntype: true,
              track: true, //it will true before 1 hours
              btnname: cancel_req + "(23:59 hour)",
              Ontap: () {},
              ontapbtn: () {
                showDialog(
                    context: context,
                    builder: (context) => Cancel_req_dialog(
                          msg: cancel_req_des1,
                        ));
              },
            );
          }),
    );
  }
}
