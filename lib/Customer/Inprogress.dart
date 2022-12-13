import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tyreshifter/Customer/Service_Detail.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Common/MessageScreen.dart';
import '../Widget/Custome_Dialog.dart';
import '../Widget/Customer_Req_Card.dart';
import '../Widget/Textfield.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Dialogs/Cancel_req_dialog.dart';
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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: size.height,
        child: ListView.builder(
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Customer_Req_Card(
                adddress: '752 Longbranch St.Calhoun, GA 30701',
                headtxt: 'Summer times',
                Img: service_img,
                track: true,
                btnname: cancel_req,
                ontapmsg: () => {nextScreen(context, MessageScreen())},
                showbottom: true,
                Ontap: () {
                  nextScreen(context, Immediate_service_detail());
                },
                ontapbtn: () {
                  showDialog(
                      context: context,
                      builder: (context) => Cancel_req_dialog(
                            msg: cancel_req_des,
                            bgcolor: color.popupbgcolor,
                          ));
                },
                color: color.txt_dark_color,
              );
            }),
      ),
    );
  }
}
