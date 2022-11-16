import 'package:flutter/material.dart';
import 'package:tyreshifter/Widget/Textfield.dart';

import '../config/TextStyles/Textstyles.dart';

class Radiobtn extends StatefulWidget {
  final String radiotxt;

  final String value;

  final style;

  Radiobtn({Key? key, required this.radiotxt, required this.value, this.style})
      : super(key: key);

  @override
  State<Radiobtn> createState() => _RadiobtnState();
}

class _RadiobtnState extends State<Radiobtn> {
  var grpvalu;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1.5,
            child: Radio(
                value: widget.value,
                groupValue: grpvalu,
                onChanged: (value) {
                  setState(() {
                    grpvalu = value.toString();
                    print("fe =>" + value.toString());
                  });
                }),
          ),
          Textfield().text(widget.radiotxt, widget.style),
        ],
      ),
    );
  }
}
