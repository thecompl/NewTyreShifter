import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/string.dart';

import '../../Widget/Gesture.dart';
import '../../Widget/Textfield.dart';
import '../../config/TextStyles/Textstyles.dart';

class Cancel_req_dialog extends StatefulWidget {
  final msg;

  Cancel_req_dialog({Key? key, this.showdesc, this.msg}) : super(key: key);
  final showdesc;
  @override
  State<Cancel_req_dialog> createState() => _Cancel_req_dialogState();
}

class _Cancel_req_dialogState extends State<Cancel_req_dialog> {
  TextEditingController Write_Comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        insetPadding: EdgeInsets.zero,
        child: SizedBox(
          width: size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Textfield().text(
                  cancel_req,
                  TextStyles.withColor(
                      TextStyles.mb18, color.text_grey2_color)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  width: size.width * 0.65,
                  child: Text(
                     widget.msg,
                      textAlign: TextAlign.center,
                      style: TextStyles.withColor(
                          TextStyles.mn16, color.textgrey_color)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                divider,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          child: Text("Cancel",
                              style: TextStyles.withColor(
                                  TextStyles.mb20, color.Primary_second_Color)),
                          onTap: () {
                            backScreen(context);
                          }),
                      Image.asset(
                        vertical,
                        height: size.height * 0.04,
                      ),
                      GestureDetector(
                          child: Text("Send",
                              style: TextStyles.withColor(
                                  TextStyles.mb20, color.Primary_second_Color)),
                          onTap: () {
                            backScreen(context);
                          })
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
