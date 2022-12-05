import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyreshifter/Widget/Custome_Dialog.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';

import '../Customer/Dialogs/Delete_dialog.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Texboxwidget.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';

class Vehicles extends StatefulWidget {
  Vehicles({Key? key}) : super(key: key);

  @override
  State<Vehicles> createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
  TextEditingController vehile_no = TextEditingController();
  @override
  void initState() {
    setState(() {
      vehile_no.text = "GJ01 PU 6756";
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.skylight,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: vehicles),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.string(company_no_iconsvg),
                          SizedBox(
                            width: 10,
                          ),
                          Textfield().text(
                              "GJ01 PU 6756",
                              TextStyles.withColor(
                                  TextStyles.mn14, color.textgrey_color)),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => Custom_dialog(
                                          iconsvg: Editsvg,
                                          iconheight: 50.0,
                                          title: edittxt,
                                          showchild: true,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 20),
                                              SvgPicture.string(
                                                Editsvg,
                                                height: 50,
                                              ),
                                              SizedBox(height: 20),
                                              Textfield().text(
                                                  edittxt,
                                                  TextStyles.withColor(
                                                      TextStyles.mb18,
                                                      color.text_grey2_color)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 10),
                                                child: TextBoxwidget(
                                                  hinttext:
                                                      enter_vehicle_numbertxt,
                                                  hintstyle:
                                                      TextStyles.withColor(
                                                          TextStyles.mn14,
                                                          color.textgrey_color),
                                                  controller: vehile_no,
                                                  border_color: color
                                                      .Primary_second_Color,
                                                  style: TextStyles.withColor(
                                                      TextStyles.mn14,
                                                      color.textgrey_color),
                                                  prefixshowicon: true,
                                                  readtype: false,
                                                  iconorimage: true,
                                                  showicon: false,
                                                  imagepath: company_no_icon,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              )
                                            ],
                                          ),
                                          cancellabel: cancel,
                                          confirmlabel: update,
                                          Oncanceltap: () {
                                            backScreen(context);
                                          },
                                          Onconfirmtap: () {
                                            backScreen(context);
                                          },
                                        ));
                              },
                              child: SvgPicture.string(Editsvg)),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => Delete_dialog(
                                          iconsvg: deletesvg,
                                          iconheight: 50.0,
                                          title: deletetxt,
                                          msg: deletepopmsg,
                                          cancellabel: no,
                                          confirmlabel: yes,
                                          Oncanceltap: () {
                                            backScreen(context);
                                          },
                                          Onconfirmtap: () {
                                            backScreen(context);
                                          },
                                        ));
                              },
                              child: SvgPicture.string(deletesvg)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
