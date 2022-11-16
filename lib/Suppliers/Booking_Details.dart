// import 'package:flutter/material.dart';
// import 'package:tyreshifter/Customer/Dialogs/Sent_request.dart';
// import 'package:tyreshifter/config/Color.dart';
// import '../Widget/Appbartext.dart';
// import '../Widget/Button.dart';
// import '../Widget/Textfield.dart';
// import '../config/Navagate_Next.dart';
// import '../config/TextStyles/Textstyles.dart';
// import '../config/string.dart';
// import 'My_Booking.dart';

// class Booking_Details extends StatefulWidget {
//   Booking_Details({Key? key}) : super(key: key);

//   @override
//   State<Booking_Details> createState() => _Booking_DetailsState();
// }

// class _Booking_DetailsState extends State<Booking_Details> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: color.white,
//         title: Center(
//           child: Textfield().text(details,
//               TextStyles.withColor(TextStyles.mb16, color.text_grey2_color)),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 35,
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(50),
//                       child:
//                           Image.asset(service_img, fit: BoxFit.cover)), //Text
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Textfield().text(
//                     "Jaylon Rosser",
//                     TextStyles.withColor(
//                         TextStyles.mb16, color.txt_dark_blue_color)),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(right: 5, bottom: 5),
//                       child: Icon(
//                         Icons.location_on_outlined,
//                         color: color.Primary_second_Color,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Container(
//                         width: size.width * 0.5,
//                         child: Textfield().text(
//                             "752 Longbranch St.Calhoun, GA 30701",
//                             TextStyles.withColor(
//                                 TextStyles.mn16, color.textgrey_color)),
//                       ),
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(right: 5),
//                           child: Image.asset(tryeicon_img),
//                         ),
//                         Textfield().text(
//                             "Kr840",
//                             TextStyles.withColor(
//                                 TextStyles.mb16, color.Primary_second_Color))
//                       ],
//                     ),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Container(height: 25, child: Image.asset(verified))
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//                 padding: EdgeInsets.all(15),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(kmicon, height: size.height * 0.04),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Textfield().text("5 KM", TextStyles.mb16)
//                         ],
//                       ),
//                     ])),
//             SizedBox(
//               height: 25,
//             ),
//             Textfield().text(service_detai, TextStyles.mb18),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.asset(
//                     service_img,
//                     height: 120,
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Textfield().text(
//                         "Change Tyre",
//                         TextStyles.withColor(
//                             TextStyles.mb18, color.txt_dark_blue_color)),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     Textfield().text(
//                         "Honda Amaze",
//                         TextStyles.withColor(
//                             TextStyles.mn14, color.txt_dark_blue_color)),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       width: size.width * 0.5,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Textfield().text(
//                               "30 April,2022",
//                               TextStyles.withColor(
//                                   TextStyles.mb14, color.txt_dark_color)),
//                           Textfield().text(
//                               "011:00 AM",
//                               TextStyles.withColor(
//                                   TextStyles.mb14, color.txt_dark_color)),
//                         ],
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   width: size.width * 0.42,
//                   child: ElevatedButton(
//                     child: Textfield().text(
//                         reject,
//                         TextStyles.withColor(
//                             TextStyles.mb18, color.Primary_second_Color)),
//                     onPressed: () {
//                       // showDialog(
//                       //     context: context, builder: (ctx) => ReviewPopUp());
//                     },
//                     style: ElevatedButton.styleFrom(
//                       elevation: 0,
//                       shape: new RoundedRectangleBorder(
//                         side: BorderSide(
//                           width: 1,
//                           color: color.Primary_second_Color,
//                         ),
//                         borderRadius: new BorderRadius.circular(15),
//                       ),
//                       primary: Colors.white,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: size.width * 0.42,
//                   child: ElevatedButton(
//                     child: Text(accept),
//                     onPressed: () {
//                       nextScreen(context, My_Booking());
//                       // showDialog(
//                       //     context: context, builder: (ctx) => Sent_request());
//                     },
//                     style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         shape: new RoundedRectangleBorder(
//                           borderRadius: new BorderRadius.circular(15),
//                         ),
//                         primary: color.Primary_second_Color,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                         textStyle: TextStyles.mb18),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
