// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'package:tyreshifter/config/Color.dart';
// import 'package:tyreshifter/config/string.dart';

// import '../Screen/Main screen/Chat.dart';
// import '../Screen/Main screen/HomeScreen.dart';
// import '../Screen/Main screen/Orders.dart';
// import '../Screen/Main screen/Profile.dart';

// class BottomBar extends StatefulWidget {
//   BottomBar({Key? key, required this.index}) : super(key: key);
//   final int index;
//   @override
//   _BottomBar createState() => _BottomBar();
// }

// class _BottomBar extends State<BottomBar> {
//   int index = 0;

//   bool table = false;

//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     setState(() {
//       this.index = widget.index;
//     });
//     super.initState();
//   }

//   Widget _bottomnavigationbar() {
//     // int _currentPage = 0;
//     // final _pageController = PageController();
//     return
//      Container(
//       // padding: EdgeInsets.only(top: 50),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//             topRight: Radius.circular(30), topLeft: Radius.circular(30)),
//         // boxShadow: [
//         //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
//         // ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30.0),
//           topRight: Radius.circular(30.0),
//         ),
//         child: BottomNavigationBar(
//           elevation: 20,
//           iconSize: 45,
//           type: BottomNavigationBarType.shifting,
//           backgroundColor: color.Primary_second_Color,
//           selectedItemColor: color.white,
//           unselectedItemColor: color.bottomunselect,
//           selectedFontSize: 12,
//           unselectedFontSize: 12,
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//           items: [
//             BottomNavigationBarItem(
//                 backgroundColor: color.PrimaryColor,
//                 icon: index == 0
//                     ? Image.asset(
//                         home_active,
//                         height: 30,
//                       )
//                     : Image.asset(
//                         home_deactive,
//                         height: 30,
//                       ),
//                 label: ""),
//             BottomNavigationBarItem(
//                 backgroundColor: color.PrimaryColor,
//                 icon: index == 1
//                     ? Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: Image.asset(
//                           timer_active,
//                           height: 30,
//                         ),
//                       )
//                     : Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: Image.asset(
//                           timer_deactive,
//                           height: 30,
//                         ),
//                       ),
//                 label: ""),
//             BottomNavigationBarItem(
//                 backgroundColor: color.PrimaryColor,
//                 icon: index == 2
//                     ? Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: Image.asset(
//                           chat_active,
//                           height: 30,
//                         ),
//                       )
//                     : Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: Image.asset(
//                           chat_deactive,
//                           height: 30,
//                         ),
//                       ),
//                 label: ""),
//             BottomNavigationBarItem(
//                 backgroundColor: color.PrimaryColor,
//                 icon: index == 3
//                     ? Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: Image.asset(
//                           person_active,
//                           height: 30,
//                         ),
//                       )
//                     : Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: Image.asset(
//                           person_deactive,
//                           height: 30,
//                         ),
//                       ),
//                 label: ""),
//           ],
//         ),
//       ),
//     );
 
 
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _bottomnavigationbar();
//   }
// }
