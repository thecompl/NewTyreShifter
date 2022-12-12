import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/string.dart';

import '../../Widget/Gesture.dart';
import '../../Widget/Textfield.dart';
import '../../config/TextStyles/Textstyles.dart';

class Custom_dialog extends StatefulWidget {
  final msg;

  final title;

  final iconsvg;

  final iconheight;

  final cancellabel;

  final confirmlabel;

  final Function? Oncanceltap;

  final Function? Onconfirmtap;
  final Function? ontaponebtn;

  final child;
  final showchild;

  final showonebtn;

  final onbtnname;
  Custom_dialog(
      {Key? key,
      this.msg,
      this.title,
      this.iconsvg,
      this.iconheight,
      this.cancellabel,
      this.confirmlabel,
      this.Oncanceltap,
      this.Onconfirmtap,
      this.child,
      this.showchild = false,
      this.showonebtn = false,
      this.ontaponebtn,
      this.onbtnname})
      : super(key: key);

  @override
  State<Custom_dialog> createState() => _Custom_dialogState();
}

class _Custom_dialogState extends State<Custom_dialog> {
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
          width: size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: widget.child,
              ),
              Image.asset(
                divider,
              ),
              !widget.showonebtn
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                widget.Oncanceltap!();
                                // backScreen(context);
                              },
                              child: Container(
                                // decoration: BoxDecoration(
                                //     border: Border.all(color: Colors.red)),
                                width: size.width * 0.39,
                                height: 60,
                                child: Center(
                                  child: Text(widget.cancellabel,
                                      style: TextStyles.withColor(
                                          TextStyles.mn18,
                                          color.txt_dark_color)),
                                ),
                              ),
                            ),
                            Image.asset(
                              vertical,
                              height: size.height * 0.06,
                            ),
                            InkWell(
                              onTap: () {
                                widget.Onconfirmtap!();
                                // backScreen(context);
                              },
                              child: Container(
                                // decoration: BoxDecoration(
                                //     border: Border.all(color: Colors.red)),
                                width: size.width * 0.39,
                                height: 60,
                                child: Center(
                                  child: Text(widget.confirmlabel,
                                      style: TextStyles.withColor(
                                          TextStyles.mb18,
                                          color.Primary_second_Color)),
                                ),
                              ),
                            )
                          ]),
                    )
                  : InkWell(
                      onTap: () {
                        widget.ontaponebtn!();
                        // backScreen(context);
                      },
                      child: Container(
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.red)),
                        width: size.width,
                        height: 60,
                        child: Center(
                          child: Text(widget.onbtnname,
                              style: TextStyles.withColor(
                                  TextStyles.mn18, color.Primary_second_Color)),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
