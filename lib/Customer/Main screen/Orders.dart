import 'package:flutter/material.dart';

import '../../Widget/BottomBar.dart';
import '../Immediate_Request.dart';

class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Immediate_Request(),
      // bottomNavigationBar: BottomBar(
      //   index: 1,
      // ),
    );
  }
}
