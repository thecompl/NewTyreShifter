import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/Customer/Assistance_tyreListDetail.dart';
import 'package:tyreshifter/Customer/Dialogs/Cancel_req_dialog.dart';
import 'package:tyreshifter/Widget/ConfirmationDialog.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Button.dart';
import 'Textfield.dart';

class Assistance_immediately_Cart extends StatefulWidget {
  final String Img;
  final String headtxt;
  final String price;
  final String quantity;
  final String adddress;
  final bool? msg;
  final bool btntype;
  final bool showbtn;
  final bool showqtyrow;
  final Function? Ontap;
  final Function? Ontapdelete;
  final Function? ondecrease;
  final Function? onincrease;
  final btnname;
  final btncolor;
  final double? height;

  Assistance_immediately_Cart({
    Key? key,
    required this.Img,
    required this.headtxt,
    required this.price,
    required this.quantity,
    required this.adddress,
    this.msg = true,
    this.btntype = false,
    this.Ontap,
    this.Ontapdelete,
    this.btnname,
    this.btncolor,
    this.showbtn = true,
    this.showqtyrow = false,
    this.height: 140,
    this.ondecrease,
    this.onincrease,
  }) : super(key: key);

  @override
  State<Assistance_immediately_Cart> createState() =>
      _Assistance_immediately_CartState();
}

class _Assistance_immediately_CartState
    extends State<Assistance_immediately_Cart> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: color.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: color.border_grey4_color,
                )),
            padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
            height: widget.height,
            child: Image.asset(widget.Img, fit: BoxFit.cover), //Text
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Textfield().text(widget.headtxt, TextStyles.mb16),
                  SizedBox(
                    height: 3,
                  ),
                  Textfield().text(
                    widget.price,
                    TextStyles.withColor(
                        TextStyles.mb16, color.Primary_second_Color),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Textfield().text(
                            widget.adddress,
                            TextStyles.withColor(
                                TextStyles.mn13, color.txt_dark_color),
                            TextAlign.left,
                            TextOverflow.ellipsis),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (widget.showqtyrow == true)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Row(children: [
                          Textfield().text(qty, TextStyles.mb14),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 90,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                    color: color.Primary_second_Color,
                                    width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      widget.ondecrease!();
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: color.Primary_second_Color,
                                      size: 16,
                                    )),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 2),
                                  child: Text(
                                    widget.quantity,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      widget.onincrease!();
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: color.Primary_second_Color,
                                      size: 16,
                                    )),
                              ],
                            ),
                          ),
                        ])),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              widget.Ontapdelete!();
                            },
                            child: SvgPicture.string(trash_iconsvg),
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
