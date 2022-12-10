import 'package:flutter/material.dart';
import 'package:tyreshifter/Suppliers/My_Booking.dart';

import 'package:tyreshifter/config/Color.dart';
import '../Common/Chat.dart';
import '../config/string.dart';

import 'MainScreen/HomeScreen.dart';
import 'MainScreen/Orders.dart';
import '../Common/Profile.dart';

class MainHomeScreen_Supplier extends StatefulWidget {
  final pageIndex;
  MainHomeScreen_Supplier({Key? key, this.pageIndex = 0}) : super(key: key);

  @override
  State<MainHomeScreen_Supplier> createState() =>
      _MainHomeScreen_SupplierState();
}

class _MainHomeScreen_SupplierState extends State<MainHomeScreen_Supplier> {
  int pageIndex = 0;

  final pages = [My_Booking(), HomeScreen(), Chat(), Profile()];

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
            iconSize: 25,
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
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            home_active,
                            height: 25,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            home_deactive,
                            height: 25,
                          ),
                        ),
                  label: bookingtxt),
              BottomNavigationBarItem(
                  backgroundColor: color.PrimaryColor,
                  icon: pageIndex == 1
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            timer_active,
                            height: 25,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            timer_deactive,
                            height: 25,
                          ),
                        ),
                  label: request),
              BottomNavigationBarItem(
                  backgroundColor: color.PrimaryColor,
                  icon: pageIndex == 2
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            chat_active,
                            height: 25,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            chat_deactive,
                            height: 25,
                          ),
                        ),
                  label: inbox),
              BottomNavigationBarItem(
                  backgroundColor: color.PrimaryColor,
                  icon: pageIndex == 3
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            person_active,
                            height: 25,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            person_deactive,
                            height: 25,
                          ),
                        ),
                  label: profile),
            ],
          ),
        ),
      ),
    );
  }
}
