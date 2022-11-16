import 'package:flutter/material.dart';
import 'package:tyreshifter/Suppliers/Setprice.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/Widget/Notetxt.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../Widget/Textfield.dart';
import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';

class Welcome_Tyreshifter extends StatefulWidget {
  Welcome_Tyreshifter({Key? key}) : super(key: key);

  @override
  State<Welcome_Tyreshifter> createState() => _Welcome_TyreshifterState();
}

class _Welcome_TyreshifterState extends State<Welcome_Tyreshifter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(height: 150, child: Image.asset(logo_without_tag)),
            SizedBox(
              height: 40,
            ),
            Textfield().text(welcome_tyreshifter, TextStyles.mb24),
            Textfield().text(welcome_tyreshifter_msg,
                TextStyles.withColor(TextStyles.mn16, color.textgrey_color)),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textfield().text("The preferred equipments",
                    TextStyles.withColor(TextStyles.mb16, color.black)),
                SizedBox(
                  height: 10,
                ),
                Notetxt(txt: welcome_1),
                Notetxt(txt: welcome_2),
                Notetxt(txt: welcome_3),
                Notetxt(txt: welcome_4),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButtons(
              name: continu,
              onTap: () {
                nextScreen(
                    context,
                    SetPrice(
                      type: "0",
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
