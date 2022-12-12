import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:tyreshifter/Suppliers/AddEmployee.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/Radiobtn.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Textfield.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import '../Common/Enable_location.dart';
import '../provider/Getweekday.dart';
import '../provider/Save_avalability.dart';
import 'MainhomeScreen.dart';

class Set_Availability extends StatefulWidget {
  final String? type;

  Set_Availability({
    Key? key,
    this.type,
  }) : super(key: key);

  @override
  State<Set_Availability> createState() => _Set_AvailabilityState();
}

class _Set_AvailabilityState extends State<Set_Availability> {
  String? _groupValue = always;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  String? gender = "Always";
  List day = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List starttime = List.filled(7, "Start time");
  List endtime = List.filled(7, "End time");

  List<bool> checkedValue = List.filled(7, false);

  var value = 0;

  TimeOfDay selectedTime = TimeOfDay.now();
  String? type;

  Getweekday getweekday = Get.put(Getweekday());
  Save_avalability save_avalabilty_ctrl = Get.put(Save_avalability());

  @override
  void initState() {
    getweekday.getweekday(context);
    print("all week daya" + getweekday.weekday.toString());
    type = widget.type!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(
          title: type == "0" ? set_availabilty : change_availability,
        ),
      ),

      // Appbartext().appbar(
      //     type == "0" ? set_availabilty : change_availability,
      //     TextStyles.withColor(TextStyles.mb16, color.black),
      //     context),
      backgroundColor: color.skylight,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Textfield().text(
                availabilty,
                TextStyles.withColor(TextStyles.mb20, color.black, 1.2),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      print("hii");
                      setState(() {
                        checkedValue = List.filled(7, true);
                      });
                    },
                    child: MyRadioOption<String>(
                      value: 'A',
                      groupValue: _groupValue,
                      onChanged: _valueChangedHandler(),
                      label: 'A',
                      text: always,
                      ontap: () {
                        checkedValue = List.filled(7, true);
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("hii");
                      setState(() {
                        checkedValue = List.filled(7, false);
                      });
                    },
                    child: MyRadioOption<String>(
                      value: 'B',
                      groupValue: _groupValue,
                      onChanged: _valueChangedHandler(),
                      label: 'B',
                      text: set_availabilty,
                      ontap: () {
                        checkedValue = List.filled(7, false);
                      },
                    ),
                  ),
                ],
              ),
              // Container(
              //   // decoration:
              //   //     BoxDecoration(border: Border.all(color: color.black)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             gender = "Always";
              //             checkedValue = List.filled(7, true);
              //           });
              //         },
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Container(
              //               // decoration: BoxDecoration(
              //               //     border: Border.all(color: color.black)),
              //
              //               child: Transform.scale(
              //                 alignment: Alignment.center,
              //                 scale: 1.5,
              //                 child: Container(
              //
              //                   child: Radio(
              //                       value: "Always",
              //                       groupValue: gender,
              //                       onChanged: (value) {
              //                         setState(() {
              //                           checkedValue = List.filled(7, true);
              //                           gender = value.toString();
              //                           print("fe =>" + value.toString());
              //                         });
              //                       }),
              //                 ),
              //               ),
              //             ),
              //             Textfield().text(
              //               always,
              //               TextStyles.withColor(
              //                   TextStyles.mb16, color.black, 1.2),
              //             ),
              //           ],
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             gender = "set Availabilty";
              //             checkedValue = List.filled(7, false);
              //           });
              //         },
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Transform.scale(
              //               scale: 1.5,
              //               child: Radio(
              //                   value: "set Availabilty",
              //                   groupValue: gender,
              //                   onChanged: (value) {
              //                     setState(() {
              //                         checkedValue = List.filled(7, false);
              //                       gender = value.toString();
              //                       print("fe =>" + value.toString());
              //                     });
              //                   }),
              //             ),
              //             Textfield().text(
              //               set_availabilty,
              //               TextStyles.withColor(
              //                   TextStyles.mb16, color.black, 1.2),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: color.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: day.length,
                        itemBuilder: (BuildContext context, int index) {
                          return availbilty_time(day[index], index);
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Textfield().text(
                          how_many_car,
                          TextStyles.withColor(TextStyles.mb16, color.black),
                          TextAlign.left),
                      increase_decraese()
                    ]),
              ),
              SizedBox(height: 20),
              ElevatedButtons(
                name: type == "0" ? done : update,
                width: size.width,
                onTap: () {
                  save_avalabilty_ctrl.save_avalability(context);

                  print("hii" + checkedValue.toString());

                  nextScreen(context, AddEmployee());
                  // nextScreen(context, Enable_location());
                },
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  availbilty_time(day, index) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: size.width,
      // height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                // value = !value!;
                checkedValue[index] = !checkedValue[index];
              });
            },
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: color.PrimaryColor)),
                  child: Transform.scale(
                      scale: 1,
                      child: Checkbox(
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                                width: 1.0, color: color.textgrey_color),
                          ),
                          value: checkedValue[index],
                          onChanged: (value) {
                            setState(() {
                              // value = !value!;
                              checkedValue[index] = !checkedValue[index];
                            });
                          })),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  // width: size.width * 0.25,
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: color.PrimaryColor)),
                  child: Textfield().text(
                      day,
                      TextStyles.withColor(
                          TextStyles.mn16, color.textgrey_color),
                      TextAlign.left),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  // datepicker();
                  String time = '';
                  if (Platform.isAndroid) {
                    time = await _selectTime(context, "Start time");
                  } else {
                    DateTime mytime = await datepicker();
                    time =
                        mytime.hour.toString() + ":" + mytime.minute.toString();
                  }

                  print("time" + time.toString());
                  setState(() {
                    starttime[index] = time;
                  });
                },
                child: Container(
                    width: 96,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: color.border_grey2_color)),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 5),
                          child: Icon(
                            Icons.access_time_rounded,
                            size: 20,
                            color: color.Primary_second_Color,
                          ),
                        ),
                        SizedBox(width: 2),
                        Textfield().text(
                            starttime[index],
                            TextStyles.withColor(
                                TextStyles.mn12, color.textgrey_color),
                            TextAlign.center),
                      ],
                    )),
              ),
              SizedBox(
                width: 7,
              ),
              InkWell(
                onTap: () async {
                  String time = '';
                  if (Platform.isAndroid) {
                    time = await _selectTime(context, "Start time");
                  } else {
                    DateTime mytime = await datepicker();
                    time =
                        mytime.hour.toString() + ":" + mytime.minute.toString();
                  }
                  setState(() {
                    endtime[index] = time;
                  });
                },
                child: Container(
                    width: 95,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: color.border_grey2_color)),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 5),
                          child: Icon(
                            Icons.access_time_rounded,
                            size: 20,
                            color: color.Primary_second_Color,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Textfield().text(
                            endtime[index],
                            TextStyles.withColor(
                                TextStyles.mn12, color.textgrey_color),
                            TextAlign.center),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  increase_decraese() {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: color.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: color.border_grey2_color)),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(5),
      //     color: Theme.of(context).accentColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                setState(() {
                  value--;
                });
              },
              child: Icon(
                Icons.remove_circle,
                color: color.Primary_second_Color,
                size: 25,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(3), color: Colors.white),
              child: Textfield().text(value.toString(),
                  TextStyles.withColor(TextStyles.mb16, color.black)),
            ),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  value++;
                });
              },
              child: Icon(
                Icons.add_circle_outlined,
                color: color.Primary_second_Color,
                size: 25,
              )),
        ],
      ),
    );
  }

  datepicker() {
    String time = "";
    return DatePicker.showTimePicker(context,
        showTitleActions: true, showSecondsColumn: false, onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {}, currentTime: DateTime.now());
  }

  _selectTime(BuildContext context, String timehint) async {
    String time = timehint;
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      time = timeOfDay.hour.toString() + ":" + timeOfDay.minute.toString();
    }

    return time;
  }
}

class MyRadioOption<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final String label;
  final String text;
  final ValueChanged<T?> onChanged;
  final Function? ontap;

  const MyRadioOption({
    required this.value,
    required this.groupValue,
    required this.label,
    required this.text,
    required this.onChanged,
    this.ontap,
  });

  @override
  State<MyRadioOption<T>> createState() => _MyRadioOptionState<T>();
}

class _MyRadioOptionState<T> extends State<MyRadioOption<T>> {
  Widget _buildLabel() {
    final bool isSelected = widget.value == widget.groupValue;

    return Container(
        // decoration: BoxDecoration(color: color.border_grey_color),
        child: isSelected
            ? Icon(
                Icons.radio_button_checked_sharp,
                size: 30,
                color: color.Primary_second_Color,
              )
            : Icon(
                Icons.radio_button_off_outlined,
                size: 30,
                color: color.Primary_second_Color,
              ));
  }

  Widget _buildText() {
    return Text(
      widget.text,
      style: TextStyles.mb18,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          widget.ontap!();
          widget.onChanged(widget.value);
        },
        // splashColor: Colors.teal.withOpacity(0.5),
        child: Row(
          children: [
            _buildLabel(),
            SizedBox(width: 5),
            _buildText(),
          ],
        ),
      ),
    );
  }
}
