import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:tyreshifter/Customer/Cancelledrequest.dart';
import 'package:tyreshifter/Customer/Completed.dart';
import 'package:tyreshifter/Customer/Inprogress.dart';
import 'package:tyreshifter/Customer/ProductList.dart';

import 'package:tyreshifter/config/Color.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../Widget/Customer_Req_Card.dart';
import '../Widget/Textfield.dart';
import '../Widget/Toggle.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Dialogs/Cancel_req_dialog.dart';
import 'Immediate_service_detail.dart';

class Products extends StatefulWidget {
  final type;
  Products({Key? key, this.type}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // var _tabTextIndexSelected = 1;
  var _listTextTabToggle = [budget, midrange, premium];
  int index = 0;
  PageController? _pageController;

  List pages = [ProductList(type: 0,), ProductList(), ProductList()];
  void initState() {
      log(widget.type.toString());
    _pageController = PageController(initialPage: index);
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
        child: Appbartext(title: Assistance),
      ),
      // Appbartext().appbar(
      //     my_req, TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.10),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 0;
                              _pageController!.jumpToPage(0);
                            });
                          },
                          child: Togglebtn(
                            txt: budget,
                            style: TextStyles.withColor(TextStyles.mb16,
                                index == 0 ? color.white : color.black),
                            active: index == 0 ? true : false,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 1;
                              _pageController!.jumpToPage(1);
                            });
                          },
                          child: Togglebtn(
                            txt: midrange,
                            style: TextStyles.withColor(TextStyles.mb16,
                                index == 1 ? color.white : color.black),
                            active: index == 1 ? true : false,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 2;
                              _pageController!.jumpToPage(2);
                            });
                          },
                          child: Togglebtn(
                            txt: premium,
                            style: TextStyles.withColor(TextStyles.mb16,
                                index == 2 ? color.white : color.black),
                            active: index == 2 ? true : false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                  // height: size.height * 0.9,
                  child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                controller: _pageController,
                itemBuilder: (context, index) {
                  return pages[index];
                },
                itemCount: pages.length, // Can be null
              )),
            ),
          ],
        ),
      ),
    );
  }
}
