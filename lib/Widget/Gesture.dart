import 'package:flutter/material.dart';

class Gesture {
  Widget gesture(text, color, route, BuildContext context, double size) {
    return GestureDetector(
        child: Text(text,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: size)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        });
  }
}// TODO Implement this library.