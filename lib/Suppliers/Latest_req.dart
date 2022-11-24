import 'package:flutter/material.dart';
import 'package:tyreshifter/Suppliers/Service_detail.dart';

import 'package:tyreshifter/config/Color.dart';

import '../Widget/Booking_Card.dart';
import '../config/Navagate_Next.dart';
import '../config/string.dart';

class Latest_req extends StatefulWidget {
  Latest_req({Key? key}) : super(key: key);

  @override
  State<Latest_req> createState() => _Latest_reqState();
}

class _Latest_reqState extends State<Latest_req> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      // height: size.height,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Booking_Card(
              adddress: "752 Longbranch St.Calhoun, GA 30701",
              headtxt: 'Jaylon Rosser',
              Img: service_img,
              showbtn: false,
              msg: false,
              btncolor: color.btncolor2,
              Ontap: () {
                nextScreen(
                    context,
                    Service_Details(
                        dropdown: false,
                        employeedropdown: true,
                        pagetype: detail,
                        status: pending));
              },
            );
          }),
    );
  }
}
