import 'package:flutter/material.dart';

import 'package:tyreshifter/config/Color.dart';

import '../../Widget/Textfield.dart';
import '../../config/Navagate_Next.dart';
import '../../config/TextStyles/Textstyles.dart';
import '../../config/string.dart';
import '../Myrequest.dart';

class Immediately_pun extends StatefulWidget {
  final title;

  final desc;

  final btn;

  final Function? Onbtn;

  Immediately_pun({Key? key, this.title, this.desc, this.btn, this.Onbtn})
      : super(key: key);
  @override
  State<Immediately_pun> createState() => _Immediately_punState();
}

class _Immediately_punState extends State<Immediately_pun> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      child: Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Container(
            height: 290,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width * 0.5,
                    child: Text(widget.title,
                        textAlign: TextAlign.center,
                        style:
                            TextStyles.withColor(TextStyles.mb24, color.black)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width * 0.65,
                    child: Text(widget.desc,
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
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // GestureDetector(
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(top: 10),
                  //       child: Text(proceed,
                  //           style: TextStyles.withColor(
                  //               TextStyles.mb20, color.Primary_second_Color)),
                  //     ),
                  //     onTap: () {
                  //       widget.Onbtn!();
                  //     }),
                  GestureDetector(
                    onTap: () {
                      widget.Onbtn!();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: color.white,
                      ),
                      alignment: Alignment.center,
                      height: 55,
                      child: InkWell(
                          child: Text(proceed,
                              style: TextStyles.withColor(TextStyles.mb18,
                                  color.Primary_second_Color, 1.3)),
                          onTap: () {
                            widget.Onbtn!();
                          }),
                    ),
                  )
                  // GestureDetector(
                  //     child: Container(
                  //       width: size.width,
                  //       height: 65,
                  //       decoration: BoxDecoration(
                  //           color: color.white,
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(20))),
                  //       child: Center(
                  //         child: Text(widget.btn,
                  //             style: TextStyles.withColor(
                  //                 TextStyles.mb20, color.Primary_second_Color)),
                  //       ),
                  //     ),
                  //     onTap: () {
                  //       widget.Onbtn!();
                  //     }),
                  // Textfield().text("Your request has \n been sent.",
                  //     TextStyles.withColor(TextStyles.mb24, color.black))
                ],
              ),
            ),
          )),
    );
  }
}
