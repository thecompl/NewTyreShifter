import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/string.dart';

import '../../Widget/Gesture.dart';
import '../../Widget/Textfield.dart';
import '../../config/TextStyles/Textstyles.dart';

class CancelBookingdailog extends StatefulWidget {
  final msg;
  final msg1;

  final title;

  final confirmlabel;

  final cancellabel;

  final Function? Onconfirmtap;
  final Function? Oncanceltap;

  CancelBookingdailog(
      {Key? key,
      this.msg,
      this.msg1,
      this.title,
      this.confirmlabel,
      this.Onconfirmtap,
      this.cancellabel,
      this.Oncanceltap})
      : super(key: key);

  @override
  State<CancelBookingdailog> createState() => _CancelBookingdailogState();
}

class _CancelBookingdailogState extends State<CancelBookingdailog> {
  TextEditingController Write_Comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Dialog(
        backgroundColor: color.popupbgcolor,
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
                  widget.title,
                  TextStyles.withColor(
                      TextStyles.mb18, color.text_grey2_color)),
              Container(
                width: size.width * 0.65,
                child: Column(
                  children: [
                    Text(widget.msg,
                        textAlign: TextAlign.center,
                        style: TextStyles.withColor(
                            TextStyles.mn18, color.textgrey_color)),
                    Text(widget.msg1,
                        textAlign: TextAlign.center,
                        style: TextStyles.withColor(
                            TextStyles.mn16, color.textgrey_color)),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Image.asset(
                divider,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        child: GestureDetector(
                            child: Text(widget.cancellabel,
                                style: TextStyles.withColor(TextStyles.mb20,
                                    color.Primary_second_Color)),
                            onTap: () {
                              widget.Oncanceltap!();
                              // backScreen(context);
                            }),
                      ),
                      Image.asset(
                        vertical,
                        height: size.height * 0.04,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        child: GestureDetector(
                            child: Text(widget.confirmlabel,
                                style: TextStyles.withColor(TextStyles.mb20,
                                    color.Primary_second_Color)),
                            onTap: () {
                              widget.Onconfirmtap!();
                              // backScreen(context);
                            }),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
