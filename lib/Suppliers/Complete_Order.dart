import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:tyreshifter/Customer/Service_Detail.dart';

import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/ConfirmationDialog.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Widget/Appbartext.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Service_Detail.dart';
import 'Withdraw.dart';

class Complete_Order extends StatefulWidget {
  Complete_Order({Key? key}) : super(key: key);

  @override
  State<Complete_Order> createState() => _Complete_OrderState();
}

class _Complete_OrderState extends State<Complete_Order> {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefilesafter;
  List<XFile>? imagefilesbefore;

  openImagesafter() async {
    try {
      var pickedfilesafter = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfilesafter != null) {
        imagefilesafter = pickedfilesafter;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file." + e.toString());
    }
  }

  openImagesbefore() async {
    try {
      var pickedfilesbefore = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfilesbefore != null) {
        imagefilesbefore = pickedfilesbefore;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file." + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid?  Size.fromHeight(appbarheight_android):Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: completed_orders),),

      // Appbartext().appbar(completed_orders,
      //     TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Textfield().text(Upload_Vehicle_photo, TextStyles.mb16),
                  SizedBox(
                    height: 20,
                  ),
                  Textfield().text(before, TextStyles.mb16),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        openImagesafter();
                      },
                      child: Image.asset(uploadbtnimg)),
                  SizedBox(
                    height: 20,
                  ),
                  imagefilesafter != null
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            children: imagefilesafter!.map((imageone) {
                              return Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: 70,
                                        width: 70,
                                        child: Image.file(
                                          File(imageone.path),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    removeimg,
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 25,
                  ),
                  Textfield().text(after, TextStyles.mb16),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        openImagesbefore();
                      },
                      child: Image.asset(uploadbtnimg)),
                  SizedBox(
                    height: 25,
                  ),
                  imagefilesbefore != null
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            children: imagefilesbefore!.map((imageone) {
                              var index = imagefilesbefore!.indexOf(imageone);
                              print("index" + index.toString());
                              return Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: 70,
                                        width: 70,
                                        child: Image.file(
                                          File(imageone.path),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // print("hii");
                                      // imagefiles!.removeAt(index);
                                    },
                                    child: Image.asset(
                                      removeimg,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        )
                      : Container(),
                  // Spacer(),
                  SizedBox(
                    height: 90,
                  ),
                  ElevatedButtons(
                    name: done,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => ConfirmationDialog(
                                destxt: submit_order_early_msg,
                                destextwidth: 0.6,
                                btntxt: done,
                              ));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
