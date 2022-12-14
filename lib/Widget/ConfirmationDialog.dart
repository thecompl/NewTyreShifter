import 'package:flutter/material.dart';

import 'package:tyreshifter/config/Color.dart';

import '../../Widget/Textfield.dart';
import '../../config/Navagate_Next.dart';
import '../../config/TextStyles/Textstyles.dart';
import '../../config/string.dart';

class ConfirmationDialog extends StatefulWidget {
  final txt;
  final btntxt;
  final Function? onTap;
  final bool head;
  final double? textwidth;
  final double? destextwidth;
  final color;
  final destxt;

  final double popup_width;
  ConfirmationDialog(
      {Key? key,
      this.txt,
      this.btntxt,
      this.onTap,
      this.head = false,
      this.destxt,
      this.textwidth = 0.5,
      this.destextwidth = 1,
      this.color,
      this.popup_width = 0.9})
      : super(key: key);
  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      child: Dialog(
          backgroundColor: widget.color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: size.width * widget.popup_width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  tick,
                  height: size.height * 0.1,
                ),
                widget.head
                    ? SizedBox(
                        height: 10,
                      )
                    : Container(),
                widget.head
                    ? Container(
                        width: size.width * widget.textwidth!,
                        child: Text(widget.txt,
                            textAlign: TextAlign.center,
                            style: TextStyles.withColor(
                                TextStyles.mb24, color.popup_txt_color)),
                      )
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width * widget.destextwidth!,
                  child: Text(widget.destxt,
                      textAlign: TextAlign.center,
                      style: TextStyles.withletterspacing(
                          TextStyles.mn16, color.popup_txt_color, 0.6)),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  divider,
                  width: double.infinity,
                ),

                GestureDetector(
                  onTap: () => widget.onTap!(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color.popupbgcolor,
                    ),
                    alignment: Alignment.center,
                    height: 80,
                    child: InkWell(
                        child: Text(widget.btntxt,
                            style: TextStyles.withColor(
                                TextStyles.mb18, color.Primary_second_Color)),
                        onTap: () => widget.onTap!()),
                  ),
                )
                // Textfield().text("Your request has \n been sent.",
                //     TextStyles.withColor(TextStyles.mb24, color.black))
              ],
            ),
          )),
    );
  }
}
