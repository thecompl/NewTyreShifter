import 'package:flutter/material.dart';
import 'package:tyreshifter/Suppliers/CancelOrder.dart';
import 'package:tyreshifter/config/Color.dart';

import '../Widget/Booking_Card.dart';
import '../config/Navagate_Next.dart';
import '../config/string.dart';
import 'Service_Detail.dart';

class Immedite_req extends StatefulWidget {
  Immedite_req({Key? key}) : super(key: key);

  @override
  State<Immedite_req> createState() => _Immedite_reqState();
}

class _Immedite_reqState extends State<Immedite_req> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      height: size.height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Booking_Card(
                adddress: "752 Longbranch St.Calhoun, GA 30701",
                headtxt: 'Jaylon Rosser',
                Img: service_img,
                showbtn: false,
                msg: false,
                immidate: true,
                btncolor: color.btncolor2,
                ontapimmidatecancle: () {
                  nextScreen(
                      context,
                      CancelOrder(
                        ordernumber: "#1211212",
                      ));
                },
                Ontap: () {
                  nextScreen(
                      context,
                      Service_Details(
                          dropdown: true,
                          pagetype: booking_details,
                          status: working));
                },
              ),
            );
          }),
    );
  }
}
