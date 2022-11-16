import 'package:flutter/material.dart';
import 'package:tyreshifter/config/string.dart';
import '../config/Color.dart';
// import '../config/string.dart';

class Textfield {
  Widget textbox(label, icon, bool password) {
    return Container(
      child: TextField(
          obscureText: password,
          cursorColor: color.PrimaryColor,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: label,
            labelStyle: TextStyle(color: Colors.black, fontSize: 20),
            prefixIcon: Icon(
              icon,
              color: color.PrimaryColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color.PrimaryColor),
            ),
          )),
    );
  }

  Widget text(text, style, [align, overflow]) {
    return Container(
        child: Text(
      text,
      style: style,
      textAlign: align,
      // softWrap: true,
      maxLines: 6,
      overflow: overflow,
    ));
  }

  Widget Button(text) {
    return Container(
        child: Text(
      text,
    ));
  }

  Widget image(
    type,
    image_path, [
    double? height,
    double? width,
  ]) {
    return type == 'asset'
        ? Container(
            child: Image(
            image: AssetImage(
              image_path,
            ),
            height: height,
            width: width,
          ))
        : Container(
            child: Image(
              image: NetworkImage(image_path),
            ),
          );
  }
}
