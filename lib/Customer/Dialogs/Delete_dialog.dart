import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/string.dart';

import '../../Widget/Gesture.dart';
import '../../Widget/Textfield.dart';
import '../../config/TextStyles/Textstyles.dart';

class Delete_dialog extends StatefulWidget {
  final msg;

  final title;

  final iconsvg;

  final iconheight;

  final cancellabel;

  final confirmlabel;

  final Function? Oncanceltap;

  final Function? Onconfirmtap;

  Delete_dialog(
      {Key? key,
      this.msg,
      this.title,
      this.iconsvg,
      this.iconheight,
      this.cancellabel,
      this.confirmlabel,
      this.Oncanceltap,
      this.Onconfirmtap})
      : super(key: key);

  @override
  State<Delete_dialog> createState() => _Delete_dialogState();
}

class _Delete_dialogState extends State<Delete_dialog> {
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
              SvgPicture.string(
                widget.iconsvg,
                height: widget.iconheight,
              ),
              SizedBox(height: 20),
              Textfield().text(
                  widget.title,
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
              Image.asset(
                divider,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: GestureDetector(
                              child: Text(widget.cancellabel,
                                  style: TextStyles.withColor(TextStyles.mb20,
                                      color.Primary_second_Color)),
                              onTap: () {
                                widget.Oncanceltap!();
                                // backScreen(context);
                              }),
                        ),
                      ),
                      Image.asset(
                        vertical,
                        height: size.height * 0.04,
                      ),
                      Expanded(
                        child: Center(
                          child: GestureDetector(
                              child: Text(widget.confirmlabel,
                                  style: TextStyles.withColor(TextStyles.mb20,
                                      color.Primary_second_Color)),
                              onTap: () {
                                widget.Onconfirmtap!();
                                // backScreen(context);
                              }),
                        ),
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
