import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyreshifter/Customer/Completed_Order.dart';
import 'package:tyreshifter/Suppliers/MyProducts.dart';
import 'package:tyreshifter/Suppliers/My_Booking.dart';
import 'package:tyreshifter/Suppliers/Set_Availability.dart';
import 'package:tyreshifter/Suppliers/Setprice.dart';
import 'package:tyreshifter/Suppliers/Withdraw.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import '../Suppliers/EmployeeList.dart';
import '../provider/Logout_ctrl.dart';
import 'Login.dart';
import '../Customer/Myrequest.dart';
import '../Widget/Appbartext.dart';
import '../Widget/BottomBar.dart';
import '../Widget/Textfield.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Change_Password_Screen.dart';
import 'Edit_Screen.dart';
import 'FaqScreen.dart';
import 'SupportScreen.dart';

// import '../Change_Password_Screen.dart';
// import '../Edit_Screen.dart';
// import '../FaqScreen.dart';
// import '../Login.dart';
// import '../Myrequest.dart';
// import '../SupportScreen.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _value = false;
  LogoutCtrl logoutctrl = Get.put(LogoutCtrl());
  String? type_account;
  final box = GetStorage();
  @override
  void initState() {
    get_typeaccount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(
          title: profile,
          show_arrow_icon: 1,
        ),
      ),

      // Appbartext().appbar(profile,
      //     TextStyles.withColor(TextStyles.mb16, color.black), context, 1),
      backgroundColor: color.skylight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:
                            Image.asset(service_img, fit: BoxFit.cover)), //Text
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Textfield().text(
                            "abc",
                            TextStyles.withletterspacing(TextStyles.mb16,
                                color.txt_dark_blue_color, 0.5, 1.2)),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Textfield().text(
                            "abd@gmail.com",
                            TextStyles.withletterspacing(TextStyles.mn16,
                                color.textgrey_color, 0.5, 1.2)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            type_account == become_shifter
                ? Padding(
                    padding: const EdgeInsets.all(15),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textfield().text(personal_bal, TextStyles.mn16),
                                Textfield().text("\$1500.00", TextStyles.mn16)
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                nextScreen(context, Withdraw());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 35,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: color.Primary_second_Color,
                                ),
                                child: Textfield().text(
                                    withdraw,
                                    TextStyles.withletterspacing(
                                        TextStyles.mb16, color.white, 0.5)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
            type_account == become_shifter
                ? SizedBox(
                    height: 15,
                  )
                : SizedBox(
                    height: 20,
                  ),
            Profilemenu(profile_person, edit_profile, () {
              nextScreen(context, Edit_Screen());
            }),
            type_account == become_shifter
                ? Divider(
                    thickness: 1,
                  )
                : Container(),
            type_account == become_shifter
                ? Profilemenu(kr_icon, edit_price, () {
                    nextScreen(
                        context,
                        SetPrice(
                          type: "1",
                        ));
                  })
                : Container(),
            Divider(
              thickness: 1,
            ),
            // Padding(
            //   padding:const EdgeInsets.only(left: 15, right: 20, top: 5, bottom: 5),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         children: [
            //           Image.asset(
            //             type_account == become_shifter
            //                 ? immi_icon
            //                 : profile_notification,
            //             height: 25,
            //             width: 31,
            //           ),
            //           SizedBox(width: 9),
            //           Container(
            //             child: Textfield().text(
            //                 type_account == become_shifter
            //                     ? immediate_req
            //                     : push_notification,
            //                 TextStyles.withletterspacing(TextStyles.mb16,
            //                     color.txt_dark_blue_color, 0.5, 1.2)),
            //           ),
            //         ],
            //       ),
            //       Container(
            //         child: CupertinoSwitch(
            //           thumbColor: color.Primary_second_Color,
            //           activeColor: color.white,
            //           value: _value,
            //           onChanged: (newValue) =>
            //               setState(() => _value = newValue),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Profilemenu(
                type_account == become_shifter
                    ? immi_icon
                    : profile_notification,
                type_account == become_shifter
                    ? immediate_req
                    : push_notification,
                null),
            Divider(
              thickness: 1,
            ),
            Profilemenu(profile_changepwd, change_Password, () {
              nextScreen(context, Change_password_Sccreen());
            }),

            Divider(
              thickness: 1,
            ),
            type_account == become_shifter
                // ? Profilemenu(profile_req, my_booking, My_Booking(appbarname:my_booking,showarrow:1))
                ? Profilemenu(profile_req, completed_bookings, () {
                    // nextScreen(context, Completed_Order());
                  })
                : Profilemenu(profile_req, completed_bookings, () {
                    nextScreen(context, Completed_Order());
                  }),
            // if (type_account != become_shifter)
            Divider(
              thickness: 1,
            ),
            type_account == become_shifter
                ? Profilemenu(change_availibity_icon, change_availability, () {
                    nextScreen(
                        context,
                        Set_Availability(
                          type: "1",
                        ));
                  })
                : Container(),
            Divider(
              thickness: 1,
            ),
            type_account == become_shifter
                ? Profilemenu(producticon, products, () {
                    nextScreen(context, MyProducts());
                  })
                : Container(),
            Divider(
              thickness: 1,
            ),
            type_account == become_shifter
                ? Profilemenu(profile_person, employee, () {
                    nextScreen(context, EmployeeList());
                  })
                : Container(),
            Divider(
              thickness: 1,
            ),
            type_account == become_shifter
                ? Profilemenu(profile_req, vehicles, () {
                    // nextScreen(
                    //     context,
                    //     Set_Availability(
                    //       type: "1",
                    //     ));
                  })
                : Container(),

            type_account == become_shifter
                ? Divider(
                    thickness: 1,
                  )
                : Container(),
            Profilemenu(profile_faq, faq, () {
              nextScreen(context, FaqScreen());
            }),
            Divider(
              thickness: 1,
            ),
            Profilemenu(profile_support, support, () {
              nextScreen(context, SupportScreen());
            }),
            Divider(
              thickness: 1,
            ),
            type_account == become_shifter
                ? Profilemenu(deletepng, deleteaccount, () {
                    // nextScreen(
                    //     context,
                    //     Set_Availability(
                    //       type: "1",
                    //     ));
                  })
                : Container(),
            if (type_account == become_shifter)
              Divider(
                thickness: 1,
              ),
            type_account == become_shifter
                ? Profilemenu(profile_logout, endshift, () {
                    // nextScreen(
                    //     context,
                    //     Set_Availability(
                    //       type: "1",
                    //     ));
                  })
                : Container(),
            if (type_account == become_shifter)
              Divider(
                thickness: 1,
              ),
            Profilemenu(profile_logout, log_out, () {
              logoutctrl.logout(context);
              if (box.read("logoutmsg") != null) nextScreen(context, Login());
            }),
            SizedBox(height: 30),
            Textfield().text(
                appversion,
                TextStyles.withColor(
                  TextStyles.mn16,
                  color.textgrey_color,
                ),
                TextAlign.center),
            SizedBox(height: 20),
          ],
        ),
      ),
      // bottomNavigationBar: BottomBar(
      //   index: 3,
      // ),
    );
  }

  Profilemenu(img, menuname, [Function? ontap]) {
    return InkWell(
      onTap: () {
        ontap!();
        // nextScreen(context, page);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black)
                      ),
                  child: Image.asset(
                    img,
                    height: 23,
                    width: 23,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Textfield().text(
                      menuname,
                      TextStyles.withletterspacing(TextStyles.mb16,
                          color.txt_dark_blue_color, 0.5, 1.2)),
                ),
              ],
            ),
            menuname != log_out
                ? menuname == push_notification || menuname == immediate_req
                    ? Container(
                        height: 20,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                        child: CupertinoSwitch(
                          thumbColor: color.Primary_second_Color,
                          activeColor: color.white,
                          value: _value,
                          onChanged: (newValue) =>
                              setState(() => _value = newValue),
                        ),
                      )
                    : menuname == deleteaccount
                        ? Container()
                        : menuname == endshift
                            ? Container()
                            : Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 20,
                              )
                : Container()
          ],
        ),
      ),
    );
  }

  get_typeaccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type_account = prefs.getString("type");
    });

    print("type" + type_account.toString());
  }
}
