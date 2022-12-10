import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tyreshifter/Customer/Dialogs/Sent_request.dart';
import 'package:tyreshifter/Suppliers/CancelOrder.dart';
import 'package:tyreshifter/Suppliers/MainhomeScreen.dart';
import 'package:tyreshifter/Suppliers/OrderDetail.dart';

import 'package:tyreshifter/Widget/ConfirmationDialog.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/getx/controller.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Assistance_immediately_Cart.dart';
import '../Widget/Button.dart';
import '../Widget/Dropdown.dart';
import '../Widget/Textfield.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';
import 'Complete_Order.dart';
import 'Dailogs/Select_Employee.dart';
import 'My_Booking.dart';

class Service_Details extends StatefulWidget {
  final bool? dropdown;
  final String? pagetype;
  final String? status;
  final bool? employeedropdown;

  Service_Details({
    Key? key,
    this.dropdown,
    this.pagetype,
    this.status,
    this.employeedropdown = false,
  }) : super(key: key);

  @override
  State<Service_Details> createState() => _Service_DetailsState();
}

class _Service_DetailsState extends State<Service_Details> {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  var currentvalue;
  DataController dcx = Get.put(DataController());
  @override
  void initState() {
    print(widget.pagetype);
    print(widget.status);
    super.initState();
  }

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        dcx.Hmscard_img = imagefiles!;
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file." + e.toString());
    }
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
        child: Appbartext(
          title: widget.pagetype == booking_details && widget.status == working
              ? booking_details
              : widget.pagetype == booking_details && widget.status == complete
                  ? complete
                  : details,
          show_arrow_icon:
              widget.dropdown! == false || widget.pagetype == booking_details
                  ? 0
                  : 1,
          elevation: 1.0,
        ),
      ),
      //
      // AppBar(
      //   elevation: 1,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: color.white,
      //   title: Center(
      //       child:
      //           widget.pagetype == booking_details && widget.status == working
      //               ? Textfield().text(
      //                   booking_details,
      //                   TextStyles.withColor(
      //                       TextStyles.mb16, color.text_grey2_color))
      //               : widget.pagetype == booking_details &&
      //                       widget.status == complete
      //                   ? Textfield().text(
      //                       complete,
      //                       TextStyles.withColor(
      //                           TextStyles.mb16, color.text_grey2_color))
      //                   : Textfield().text(
      //                       details,
      //                       TextStyles.withColor(
      //                           TextStyles.mb16, color.text_grey2_color))),
      // ),
      //
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(service_img,
                                fit: BoxFit.cover)), //Text
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Textfield().text(
                          "Jaylon Rosser",
                          TextStyles.withColor(
                              TextStyles.mb16, color.txt_dark_blue_color)),
                    ],
                  ),
                  if (widget.status == working)
                    GestureDetector(
                        onTap: () {
                          nextScreen(
                              context,
                              CancelOrder(
                                ordernumber: '1212121',
                              ));
                        },
                        child: SvgPicture.string(cancelordersvg))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5, bottom: 5),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: color.Primary_second_Color,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: size.width * 0.5,
                          child: Textfield().text(
                              "752 Longbranch St.Calhoun, GA 30701",
                              TextStyles.withColor(
                                  TextStyles.mn16, color.textgrey_color)),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(tryeicon_img),
                          SizedBox(
                            width: 5,
                          ),
                          Textfield().text(
                              "Kr840",
                              TextStyles.withColor(
                                  TextStyles.mb16, color.Primary_second_Color))
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(height: 25, child: Image.asset(verified))
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 15,
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Row(
                      children: [
                        Image.asset(kmicon, height: size.height * 0.04),
                        SizedBox(
                          width: 10,
                        ),
                        Textfield().text("5 KM", TextStyles.mb16)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textfield().text(
                            completed_orders,
                            TextStyles.withColor(
                                TextStyles.mb16, color.txt_dark_blue_color)),
                        Textfield().text(
                            "10",
                            TextStyles.withColor(
                                TextStyles.mn14, color.textgrey_color)),
                      ],
                    )
                  ])),
              SizedBox(
                height: 25,
              ),
              Textfield().text(service_detai, TextStyles.mb18),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      service_img,
                      height: size.height * 0.13,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textfield().text("Change Tyre", TextStyles.mb18),
                      SizedBox(
                        height: 10,
                      ),
                      Textfield().text("Honda Amaze", TextStyles.mn14),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textfield().text("30 April,2022", TextStyles.mb14),
                            Textfield().text("11:00 AM", TextStyles.mb14),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // if (widget.status == notstart)
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Textfield().text(
              //           midrange,
              //           TextStyles.withColor(
              //               TextStyles.mb18, color.Primary_second_Color)),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Container(
              //         // elevation: 0,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           border: Border.all(
              //               color: color.border_grey4_color, width: 0.5),
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //           child: Assistance_immediately_Cart(
              //             adddress: "Per tyre, fitted.",
              //             price: "£139.23",
              //             headtxt: 'UNIROYAL 255 35 R19 96Y RAINSPORT 5',
              //             Img: tyre_img,
              //             btnname: working,
              //             btncolor: color.btncolor3,
              //             quantity: '1',
              //             height: 125,
              //             Ontap: () {
              //               // nextScreen(
              //               //     context,
              //               //     Assistance_tyreListDetail(
              //               //         // dropdown: true,
              //               //         // pagetype: booking_details,
              //               //         // status: working
              //               //         ));
              //             },
              //             Ontapdelete: () {},
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              SizedBox(
                height: 10,
              ),
              widget.employeedropdown == true && widget.status == pending
                  ? GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Select_Employee());
                      },
                      child: Container(
                        width: size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: color.Primary_second_Color, width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Textfield().text(
                              selectEmployee,
                              TextStyles.withColor(TextStyles.mb16,
                                  color.Primary_second_Color, 1.0),
                            ),
                            SvgPicture.string(
                              arrowdown_iconsvg,
                              height: 6,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 10),
                        // hinttxt: selectEmployee,
                        // style: TextStyles.withColor(
                        //     TextStyles.mb14, color.Primary_second_Color),
                        // // list: [
                        // //   "Select Employee",
                        // // ],
                        // current_value: currentvalue,
                        // onchange: (value) {
                        //   showDialog(
                        //       context: context,
                        //       builder: (context) => Select_Employee());
                        // },
                        // border_color: color.Primary_second_Color,
                        // height: 52,
                        // Textalignment: AlignmentDirectional.centerStart,
                      ),
                    )
                  : widget.status != pending
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textfield().text(
                                midrange,
                                TextStyles.withColor(TextStyles.mb18,
                                    color.Primary_second_Color)),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              // elevation: 0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: color.border_grey4_color,
                                    width: 0.5),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Assistance_immediately_Cart(
                                  adddress: "Per tyre, fitted.",
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
                          ],
                        )
                      : Container(),
              // SizedBox(
              //   height: 20,
              // ),
              // Spacer(),
              // widget.dropdown! && widget.status != complete
              //     ? Dropdown(
              //         width: size.width * 0.9,
              //         hinttxt: "vehicle_type",
              //         style: TextStyles.withColor(
              //             TextStyles.mb14, color.Primary_second_Color),
              //         list: ["Ongoing", "Completed", in_progess, "Not started"],
              //         current_value: currentvalue,
              //         border_color: color.Primary_second_Color,
              //         height: 52,
              //         Textalignment: AlignmentDirectional.center,
              //       )
              //     : Container(),
              widget.status == complete
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Textfield().text(
                            upload_image,
                            TextStyles.withColor(
                                TextStyles.mb16, color.Primary_second_Color)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  openImages();
                                },
                                child: SvgPicture.string(upload_iconsvg)),
                            imagefiles != null
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Wrap(
                                      children: imagefiles!.map((imageone) {
                                        return Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Container(
                                                  height: 60,
                                                  width: 60,
                                                  child: Image.file(
                                                    File(imageone.path),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Image.asset(
                                              removeimg,
                                              height: 15,
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(
                height: 40,
              ),
              widget.status == pending
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButtons(
                          active: true,
                          colorbtn: color.white,
                          width: 0.42,
                          height: 55,
                          style: TextStyles.withColor(
                            TextStyles.mb16,
                            color.Primary_second_Color,
                          ),
                          name: reject,
                          onTap: () {},
                        ),
                        ElevatedButtons(
                          width: 0.42,
                          height: 55,
                          style: TextStyles.mb16,
                          name: accept,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => ConfirmationDialog(
                                      destextwidth: 0.8,
                                      btntxt: view_booking_btn_txt,
                                      destxt: viewbookingmsg,
                                      onTap: () {
                                        nextScreen(
                                            context,
                                            MainHomeScreen_Supplier(
                                                pageIndex: 0));
                                      },
                                    ));
                          },
                        ),
                      ],
                    )
                  : widget.status == working
                      ? ElevatedButtons(
                          // width: 0.42,
                          height: 55,
                          style: TextStyles.mb16,
                          name: startWorking,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => ConfirmationDialog(
                                      destextwidth: 0.8,
                                      btntxt: view_booking_btn_txt,
                                      destxt: viewbookingmsg,
                                      onTap: () {
                                        nextScreen(
                                            context,
                                            MainHomeScreen_Supplier(
                                                pageIndex: 0));
                                      },
                                    ));
                          },
                        )
                      : widget.status == complete
                          ? ElevatedButtons(name: completework)
                          : Container()
            ],
          ),
        ),
      ),
    );
  }
}
