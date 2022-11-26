import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/string.dart';

import '../../Widget/Gesture.dart';
import '../../Widget/Textfield.dart';
import '../../config/TextStyles/Textstyles.dart';

class Quantitydailog extends StatefulWidget {
  final msg;

  final title;

  final iconsvg;

  final iconheight;

  final confirmlabel;

  final Function? Onconfirmtap;

  final showicon;

  final quantity;

  final showquantity;

  final showtitle;

  Quantitydailog(
      {Key? key,
      this.msg,
      this.title,
      this.iconsvg,
      this.iconheight,
      this.confirmlabel,
      this.Onconfirmtap,
      this.showicon = false,
      this.quantity,
      this.showquantity = true,
      this.showtitle = true})
      : super(key: key);

  @override
  State<Quantitydailog> createState() => _QuantitydailogState();
}

class _QuantitydailogState extends State<Quantitydailog> {
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
              if (widget.showicon)
                SvgPicture.string(
                  widget.iconsvg,
                  height: widget.iconheight,
                ),
              if (widget.showicon) SizedBox(height: 20),
              if (widget.showtitle)
                Column(
                  children: [
                    Textfield().text(
                        widget.title,
                        TextStyles.withColor(
                            TextStyles.mb18, color.text_grey2_color)),
                    SizedBox(height: 10),
                  ],
                ),
              widget.showquantity
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // width: size.width * 0.65,
                            child: Text(widget.msg,
                                textAlign: TextAlign.center,
                                style: TextStyles.withColor(
                                    TextStyles.mb16, color.text_grey2_color)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: color.Primary_second_Color,
                                      width: 2)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.remove,
                                      color: color.Primary_second_Color,
                                      size: 22,
                                    ),
                                  ),
                                  Textfield()
                                      .text(widget.quantity, TextStyles.mb18),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.add,
                                      color: color.Primary_second_Color,
                                      size: 22,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Container(
                        width: size.width * 0.65,
                        child: Text(widget.msg,
                            textAlign: TextAlign.center,
                            style: TextStyles.withColor(
                                TextStyles.mn14, color.textgrey_color)),
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
                              child: Text(widget.confirmlabel,
                                  style: TextStyles.withColor(TextStyles.mb20,
                                      color.Primary_second_Color)),
                              onTap: () {
                                widget.Onconfirmtap!();
                                // backScreen(context);
                              }),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
