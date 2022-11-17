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

  final destxt;
  ConfirmationDialog(
      {Key? key,
      this.txt,
      this.btntxt,
      this.onTap,
      this.head = false,
      this.destxt,
      this.textwidth = 0.5,
      this.destextwidth = 1})
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
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: size.width * 0.9,
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
                  height: 20,
                ),
                Container(
                  width: size.width * widget.destextwidth!,
                  child: Text(widget.destxt,
                      textAlign: TextAlign.center,
                      style: TextStyles.withletterspacing(
                          TextStyles.mn16, color.textgrey_color, 0.6)),
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
                      color: color.white,
                    ),
                    alignment: Alignment.center,
                    height: 60,
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
