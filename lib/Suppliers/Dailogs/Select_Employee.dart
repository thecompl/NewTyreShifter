import 'package:flutter/material.dart';
import 'package:tyreshifter/Widget/Button.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';

import '../../Widget/Texboxwidget.dart';
import '../../Widget/Textfield.dart';
import '../../config/TextStyles/Textstyles.dart';
import '../../config/string.dart';

class Select_Employee extends StatefulWidget {
  Select_Employee({Key? key}) : super(key: key);

  @override
  State<Select_Employee> createState() => _Select_EmployeeState();
}

class _Select_EmployeeState extends State<Select_Employee> {
  TextEditingController Serach = TextEditingController();
  List checked = List.generate(6, (index) => false);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: size.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              TextBoxwidget(
                hinttext: searchheretxt,
                hintstyle: TextStyles.withColor(
                    TextStyles.mb14, color.text_grey2_color),
                controller: Serach,
                border_color: color.Primary_second_Color,
                style: TextStyles.withColor(TextStyles.mb14, color.black),
                prefixshowicon: false,
                iconorimage: false,
                // ontap: () {
                //   // print("hii");
                //   // opendatepiker();
                //   setState(() {
                //     // address.text = "114, zoo chopati pawder USA";
                //   });
                // },
                readtype: false,
                showicon: false,
              ),
              SizedBox(height: 10),
              Container(
                height: size.height * .6,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return select_emp(working, i);
                  },
                ),
              ),
              SizedBox(height: 10),
              ElevatedButtons(
                name: selecttxt,
                width: 0.4,
                height: 55,
                onTap: () {
                  backScreen(context);
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  select_emp(working, index) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 35,
                  width: 30,
                  child: Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                        checkColor: color.Primary_second_Color,
                        fillColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                              width: 1.0, color: color.Primary_second_Color),
                        ),
                        value: checked[index],
                        onChanged: (value) {
                          setState(() {
                            checked[index] = value!;
                          });
                        }),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // width: size.width * 0.25,
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: color.PrimaryColor)),
                      child: Textfield().text(
                          "Jaylon Rosser",
                          TextStyles.withColor(
                              TextStyles.mb18, color.text_grey2_color),
                          TextAlign.left),
                    ),
                    Container(
                      // width: size.width * 0.25,
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: color.PrimaryColor)),
                      child: Textfield().text(
                          "Gj01 Pu6756",
                          TextStyles.withColor(
                              TextStyles.mn16, color.text_grey2_color),
                          TextAlign.left),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(kmicon, height: 30),
                        SizedBox(
                          width: 10,
                        ),
                        Textfield().text(
                            "5 KM",
                            TextStyles.withColor(
                                TextStyles.mb16, color.Primary_second_Color))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: color.green_bg_color,
                      borderRadius: BorderRadius.circular(20)),
                  child: Textfield().text(
                      availabletxt,
                      TextStyles.withColor(
                          TextStyles.mb14, color.greentxt_color)),
                )
              ],
            ),
          ],
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}
