import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tyreshifter/Customer/Dialogs/Filter_dialog.dart';
import 'package:tyreshifter/Customer/Send_request.dart';
import 'package:tyreshifter/Customer/Service_Detail.dart';
import 'package:tyreshifter/Widget/Dropdown.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/config/string.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Booking_Card.dart';
import '../Widget/Customer_Req_Card.dart';
import '../Widget/Textfield.dart';

class HomeCalendarPage extends StatefulWidget {
  @override
  _HomeCalendarPageState createState() => _HomeCalendarPageState();
}

class _HomeCalendarPageState extends State<HomeCalendarPage> {
  CalendarController? _controller;
  List time_list = ["11:00 AM", '1:00 AM', "12:00 AM"];

  var currentvalue;
  var a = 10;
  var b = 10;
  String? type_account;
  @override
  void initState() {
    get_typeaccount();
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(
          title: type_account == get_shifter ? home : calendertxt,
          show_icon: type_account == get_shifter ? 1 : 0,
          icon: type_account == get_shifter ? Icons.filter_list : null,
          show_arrow_icon: type_account == get_shifter ? 0 : 1,
          ontap: () {
            showDialog(context: context, builder: (context) => Filter_dialog());
          },
          elevation: type_account == get_shifter ? 0.0 : 1.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: color.skylight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: color.white,
                child: TableCalendar(
                  initialCalendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                      weekdayStyle: TextStyles.mb12,
                      weekendStyle: TextStyles.mb12,
                      todayColor: color.Primary_second_Color,
                      selectedColor: color.Primary_second_Color,
                      todayStyle: TextStyles.mb12),

                  headerStyle: HeaderStyle(
                    headerPadding: EdgeInsets.all(15),
                    leftChevronIcon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    ),
                    rightChevronIcon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    ),
                    leftChevronPadding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 5),
                    rightChevronPadding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 5),
                    leftChevronMargin: EdgeInsets.symmetric(horizontal: 2),
                    rightChevronMargin: EdgeInsets.symmetric(horizontal: 2),

                    // headerMargin: EdgeInsets.only(left: ),
                    titleTextStyle: TextStyles.mb18,
                    centerHeaderTitle: false,
                    formatButtonDecoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    // formatButtonTextStyle: TextStyle(color: Colors.black),
                    // formatButtonShowsNext: true,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  // onDaySelected: (date, events) {

                  // },
                  builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, events) => Container(
                        margin: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: color.Primary_second_Color,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyles.withColor(
                              TextStyles.mb12, color.white),
                        )),
                    todayDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: color.Primary_second_Color,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyles.withColor(
                              TextStyles.mb12, color.white),
                        )),
                  ),
                  calendarController: _controller,
                ),
              ),
              Container(
                color: color.white,
                // decoration:
                //     BoxDecoration(border: Border.all(color: color.black)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: type_account == get_shifter
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textfield().text(time, TextStyles.mb18),
                            Dropdown(
                              width: 120,
                              hinttxt: "vehicle type",
                              style: TextStyles.withColor(
                                  TextStyles.mn14, color.black),
                              list: time_list,
                              current_value: currentvalue,
                              border_color: Colors.transparent,
                              dropdowncolor: color.dropdown_bg_color,
                              height: 52,
                            )
                          ],
                        )
                      : Container(),
                ),
              ),
              type_account == get_shifter
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) {
                            return Customer_Req_Card(
                              adddress: '752 Longbranch St.Calhoun, GA 30701',
                              headtxt: 'Summer times',
                              Img: service_img,
                              btnname: cancel_req + " (23:59 hour)",
                              showbtn: false,
                              msg: false,
                              Ontap: () {
                                nextScreen(
                                    context,
                                    Service_Detail(
                                      type: "0",
                                    ));
                              },
                            );
                          }),
                    )
                  : Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Booking_Card(
                              adddress: "752 Longbranch St.Calhoun, GA 30701",
                              headtxt: 'Jaylon Rosser',
                              Img: service_img,
                              showbtn: false,
                              msg: false,
                              btncolor: color.btncolor2,
                              Ontap: () {
                                print("hiii");
                                // nextScreen(
                                //     context,
                                //     Service_Details(
                                //       dropdown: false,
                                //       pagetype: booking_details,
                                //     ));
                                //
                                // showDialog(
                                //     context: context,
                                //     builder: (context) => Filter_dialog());
                              },
                            );
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }

  showdialog() {
    return showDialog(context: context, builder: (context) => Filter_dialog());
  }

  get_typeaccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type_account = prefs.getString("type");
    });

    print("type" + type_account.toString());
  }
}
