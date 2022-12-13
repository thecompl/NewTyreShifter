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

  final bgcolor;

  Cancel_req_dialog({Key? key, this.showdesc, this.msg, this.bgcolor})
      : super(key: key);
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
        backgroundColor: widget.bgcolor,
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
                  child: Text(widget.msg,
                      textAlign: TextAlign.center,
                      style: TextStyles.withColor(
                          TextStyles.mn16, color.textgrey_color)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
                child: Image.asset(
                  divider,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // widget.Oncanceltap!();
                        backScreen(context);
                      },
                      child: Container(
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.red)),
                        width: size.width * 0.39,
                        height: 60,
                        child: Center(
                          child: Text("Cancel",
                              style: TextStyles.withColor(
                                  TextStyles.mb18, color.Primary_second_Color)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: color.border_grey_color,
                      ),
                    ),
                    // Image.asset(
                    //   vertical,
                    //   height: size.height * 0.06,
                    // ),
                    InkWell(
                      onTap: () {
                        // widget.Onconfirmtap!();
                        backScreen(context);
                      },
                      child: Container(
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.red)),
                        width: size.width * 0.39,
                        height: 60,
                        child: Center(
                          child: Text('send',
                              style: TextStyles.withColor(
                                  TextStyles.mb18, color.Primary_second_Color)),
                        ),
                      ),
                    )
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
