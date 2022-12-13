import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../config/TextStyles/Textstyles.dart';
import 'Textfield.dart';

class StatusWidget extends StatefulWidget {
  final bgcolor;

  final status;

  final statustxtcolor;

  const StatusWidget(
      {super.key, this.bgcolor, this.status, this.statustxtcolor});

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      decoration: BoxDecoration(
          color: widget.bgcolor, borderRadius: BorderRadius.circular(5)),
      width: 80,
      child: Textfield().text(
          widget.status.toString(),
          TextStyles.withColor(TextStyles.mb12, widget.statustxtcolor),
          TextAlign.center),
    );
  }
}
