import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/TextStyles/Textstyles.dart';
import 'package:tyreshifter/config/string.dart';

import '../../Common/NotificationScreen.dart';
import '../../Widget/BottomBar.dart';
import '../../Widget/Textfield.dart';
import '../../config/Navagate_Next.dart';
import '../Myrequest.dart';

import '../Service_Detail.dart';
import '../Shifterdes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool need_tyre = false;
  bool resever_tyre = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          elevation: 0.9,
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: color.white,

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          backgroundColor: color.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: color.black)
                      // ),
                      child: Image.asset(
                        enable_locationimg,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textfield().text(
                            enable_location,
                            TextStyles.withletterspacing(
                                TextStyles.mb16, color.text_grey2_color, 0.5)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              // decoration: BoxDecoration(
                              //     border: Border.all(color: color.black)),
                              child: Textfield().text(
                                  "Norway",
                                  TextStyles.withletterspacing(TextStyles.mn16,
                                      color.textgrey_color, 0.5)),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Container(
                              height: 30,
                              // decoration: BoxDecoration(
                              //     border: Border.all(color: color.black)),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: color.Primary_second_Color,
                                size: 30,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    nextScreen(context, NotificationScreen());
                  },
                  child: Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      resever_tyre = true;
                      need_tyre = false;
                      nextScreen(context, Shifter_Des(type: "0"));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: resever_tyre == true
                            ? Border.all(
                                width: 3,
                                color: color.Primary_second_Color,
                              )
                            : null,
                        borderRadius: resever_tyre == true
                            ? BorderRadius.circular(30)
                            : null),
                    child: SvgPicture.string(home_activeservicesvg,
                        width: size.width * 0.42,
                        // height: size.height * 0.3,
                        fit: BoxFit.fill),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      need_tyre = true;
                      resever_tyre = false;
                      nextScreen(context, Shifter_Des(type: "1"));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: need_tyre == true
                            ? Border.all(
                                width: 3,
                                color: color.Primary_second_Color,
                              )
                            : null,
                        borderRadius: need_tyre == true
                            ? BorderRadius.circular(28)
                            : null),
                    child: SvgPicture.string(home_assistancesvg,
                        width: size.width * 0.42,
                        // height: size.height * 0.3,
                        fit: BoxFit.fill),
                  ),
                )
              ]),
              SizedBox(height: 50),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Textfield().text(
                      availble_today,
                      TextStyles.withletterspacing(
                          TextStyles.mb18, color.text_grey2_color, 0.3))),
              SizedBox(height: 20),
              SingleChildScrollView(
                child: Container(
                  // decoration: BoxDecoration(border: Border.all(color: color.black)),
                  height: 190,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return servicecard("Summer tires");
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  servicecard(name) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        print("hii");
        nextScreen(context, Service_Detail(type: "0"));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                service_img,
                height: size.height * 0.13,
              ),
              SizedBox(
                height: 5,
              ),
              Textfield().text(
                  name,
                  TextStyles.withColor(
                      TextStyles.mb14, color.text_grey2_color)),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Image.asset(tryeicon_img),
                  ),
                  Textfield().text(
                      "Kr840",
                      TextStyles.withColor(
                          TextStyles.mb12, color.Primary_second_Color))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
