import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:tyreshifter/Customer/Cancelledrequest.dart';
import 'package:tyreshifter/Customer/Completed.dart';
import 'package:tyreshifter/Customer/Inprogress.dart';
import 'package:tyreshifter/Customer/ProductList.dart';
import 'package:tyreshifter/config/Color.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Assistance_immediately_Card.dart';
import '../Widget/Assistance_immediately_Cart.dart';
import '../Widget/Button.dart';
import '../Widget/Customer_Req_Card.dart';
import '../Widget/Textfield.dart';
import '../Widget/Toggle.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'dart:math' as math;

class MyProducts extends StatefulWidget {
  final type;
  MyProducts({Key? key, this.type}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> with TickerProviderStateMixin {
  bool value = true;
  late AnimationController _controller;
  List icons = [
    addproductsvg,
    exceliconsvg,
  ];
  List text = [
    addproducts,
    uploadcsv,
  ];
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: color.white,
        appBar: PreferredSize(
          preferredSize: Platform.isAndroid
              ? Size.fromHeight(appbarheight_android)
              : Size.fromHeight(appbarheight_ios),
          child: Appbartext(title: products),
        ),
        floatingActionButton: new Column(
          mainAxisSize: MainAxisSize.min,
          children: new List.generate(icons.length, (int index) {
            Widget child = new Container(
              height: 70.0,
              alignment: FractionalOffset.centerRight,
              child: new ScaleTransition(
                scale: new CurvedAnimation(
                  parent: _controller,
                  curve: new Interval(0.0, 1.0 - index / icons.length / 2.0,
                      curve: Curves.easeOut),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: color.white,
                      child: Textfield().text(
                          text[index].toString(),
                          TextStyles.withColor(
                              TextStyles.mn14, color.txt_dark_color)),
                    ),
                    new FloatingActionButton(
                      heroTag: null,
                      backgroundColor: color.white,
                      mini: true,
                      child: new SvgPicture.asset(
                        icons[index],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
            return child;
          }).toList()
            ..add(
              Container(
                alignment: FractionalOffset.centerRight,
                child: new FloatingActionButton(
                  // alignment: FractionalOffset.center,
                  heroTag: null,
                  backgroundColor: color.Primary_second_Color,
                  child: new AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget) {
                      return Transform(
                        transform: new Matrix4.rotationZ(
                            _controller.value * 0.5 * math.pi),
                        alignment: FractionalOffset.center,
                        child: new Icon(
                            _controller.isDismissed ? Icons.add : Icons.close),
                      );
                    },
                  ),
                  onPressed: () {
                    if (_controller.isDismissed) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                  },
                ),
              ),
            ),
        ),
        body: value == true
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: Container(
                                // elevation: 0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: color.border_grey4_color,
                                      width: 0.5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 9.0),
                                  child: Assistance_immediately_Cart(
                                    adddress: availableqty + "5",
                                    price: "£139.23",
                                    headtxt:
                                        'UNIROYAL 255 35 R19 96Y RAINSPORT 5',
                                    Img: tyre_img,
                                    btnname: working,
                                    btncolor: color.btncolor3,
                                    quantity: '1',
                                    height: 125,
                                    Ontap: () {
                                      // nextScreen(
                                      //     context,
                                      //     Assistance_tyreListDetail(
                                      //         // dropdown: true,
                                      //         // pagetype: booking_details,
                                      //         // status: working
                                      //         ));
                                    },
                                    Ontapdelete: () {},
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )
            : Container(
                height: size.height,
                child: Center(child: SvgPicture.string(sadfaceicon)),
              ));
  }
}
