import 'package:flutter/material.dart';

import 'package:tyreshifter/config/Color.dart';

import '../../Widget/Textfield.dart';
import '../../config/Navagate_Next.dart';
import '../../config/TextStyles/Textstyles.dart';
import '../../config/string.dart';
import '../Myrequest.dart';

class Sent_request extends StatefulWidget {
  Sent_request({Key? key}) : super(key: key);
  @override
  State<Sent_request> createState() => _Sent_requestState();
}

class _Sent_requestState extends State<Sent_request> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      child: Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          // insetPadding: EdgeInsets.zero,
          child: Container(
            height: 500,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    tick,
                    height: size.height * 0.1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width * 0.5,
                    child: Text(sent_reuest,
                        textAlign: TextAlign.center,
                        style:
                            TextStyles.withColor(TextStyles.mb24, color.black)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width * 0.65,
                    child: Text(req_des,
                        textAlign: TextAlign.center,
                        style: TextStyles.withColor(
                            TextStyles.mn16, color.textgrey_color)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    divider,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(view_req,
                            style: TextStyles.withColor(
                                TextStyles.mb20, color.Primary_second_Color)),
                      ),
                      onTap: () {
                        nextScreen(context, Myrequest());
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  // Textfield().text("Your request has \n been sent.",
                  //     TextStyles.withColor(TextStyles.mb24, color.black))
                ],
              ),
            ),
          )),
    );
  }
}
