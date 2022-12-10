import 'package:flutter/material.dart';

import 'package:tyreshifter/config/Color.dart';
import '../Common/Chat.dart';
import '../Common/Profile.dart';

import '../config/string.dart';

import 'Main screen/HomeScreen.dart';
import 'Main screen/Orders.dart';

class MainHomeScreen_Customer extends StatefulWidget {
  final pageIndex;
  MainHomeScreen_Customer({Key? key, this.pageIndex = 0}) : super(key: key);

  @override
  State<MainHomeScreen_Customer> createState() =>
      _MainHomeScreen_CustomerState();
}

class _MainHomeScreen_CustomerState extends State<MainHomeScreen_Customer> {
  int pageIndex = 0;

  final pages = [HomeScreen(), Orders(), Chat(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      pageIndex = widget.pageIndex;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.skylight,
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        // padding: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          color: color.skylight,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          // boxShadow: [
          //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          // ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            elevation: 20,
            iconSize: 45,
            type: BottomNavigationBarType.fixed,
            backgroundColor: color.Primary_second_Color,
            selectedItemColor: color.white,
            unselectedItemColor: color.bottomunselect,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: pageIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: color.PrimaryColor,
                  icon: pageIndex == 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Image.asset(
                            home_active,
                            height: 30,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Image.asset(
                            home_deactive,
                            height: 30,
                          ),
                        ),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: color.PrimaryColor,
                  icon: pageIndex == 1
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            timer_active,
                            height: 30,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            timer_deactive,
                            height: 30,
                          ),
                        ),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: color.PrimaryColor,
                  icon: pageIndex == 2
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            chat_active,
                            height: 30,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            chat_deactive,
                            height: 30,
                          ),
                        ),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: color.PrimaryColor,
                  icon: pageIndex == 3
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            person_active,
                            height: 30,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            person_deactive,
                            height: 30,
                          ),
                        ),
                  label: ""),
            ],
          ),
        ),
      ),
    );
  }
}
