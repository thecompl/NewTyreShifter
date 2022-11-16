import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyreshifter/config/Color.dart';
import '../../Customer/Immediate_Request.dart';
import '../../Widget/Appbartext.dart';
import '../../Widget/BottomBar.dart';
import '../../config/TextStyles/Textstyles.dart';
import '../../config/string.dart';
import '../Immidiate_req.dart';

class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(40):Size.fromHeight(40+10),
        child: Appbartext(title: immediate_req,show_arrow_icon: 1,),),
      // Appbartext().appbar(immediate_req,
      //     TextStyles.withColor(TextStyles.mb16, color.black), context, 1),
      body: Immedite_req(),
    );
  }
}
