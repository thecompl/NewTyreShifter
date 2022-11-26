import 'package:flutter/material.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';

class TextBoxwidget extends StatefulWidget {
  final labeltxt;

  final prefixicon;

  final IconData? suffixicon;

  final border_color;
  final Function? ontap;

  final TextEditingController? controller;

  final bool readtype;

  final style;

  final bool? iconorimage;

  final String? imagepath;

  final String? hinttext;

  final hintstyle;

  final bool? showicon;
  final bool? prefixshowicon;

  final keyboradtype;

  final height;

  final width;

  TextBoxwidget(
      {Key? key,
      this.labeltxt,
      this.prefixicon,
      this.suffixicon,
      this.border_color,
      this.ontap,
      this.controller,
      required this.readtype,
      this.style,
      this.iconorimage = false,
      this.imagepath,
      this.hinttext,
      this.hintstyle,
      this.showicon = true,
      this.keyboradtype = TextInputType.text,
      this.height,
      this.width,
      this.prefixshowicon})
      : super(key: key);

  @override
  State<TextBoxwidget> createState() => _TextBoxwidgetState();
}

class _TextBoxwidgetState extends State<TextBoxwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            border: Border.all(color: widget.border_color),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: TextField(
            // textAlign: Alignment.center,
              keyboardType: widget.keyboradtype,
              onTap: () {
                widget.ontap!();
              },
              style: widget.style,
              readOnly: widget.readtype,
              controller: widget.controller,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 10, top: 15 // HERE THE IMPORTANT PART
                          ),
                  border: InputBorder.none,
                  hintText: widget.hinttext,
                  hintStyle: widget.hintstyle,
                  // labelText: widget.labeltxt,
                  // labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                  prefixIcon: widget.prefixshowicon!
                      ? widget.iconorimage!
                          ? Padding(
                              padding: const EdgeInsets.all(15),
                              child: Image.asset(
                                widget.imagepath!,
                                width: 20,
                                height: 20,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Icon(widget.prefixicon)
                      : null,
                  suffixIcon: widget.showicon!
                      ? widget.iconorimage!
                          ? Padding(
                              padding: const EdgeInsets.all(15),
                              child: Image.asset(
                                widget.imagepath!,
                                width: 25,
                                height: 25,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Icon(widget.suffixicon)
                      : Padding(padding: EdgeInsets.all(5)))),
        ));
  }
}
