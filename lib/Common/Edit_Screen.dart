import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';

import 'package:tyreshifter/config/string.dart';

import '../Widget/Appbartext.dart';
import '../Widget/Button.dart';
import '../config/TextStyles/Textstyles.dart';

class Edit_Screen extends StatefulWidget {
  Edit_Screen({Key? key}) : super(key: key);

  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(title: edit_profile),
      ),

      // Appbartext().appbar(edit_profile,
      //     TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Image.asset(
                edit_icon,
                height: size.height * 0.15,
              )),
              SizedBox(height: 20),
              textbox(email, enter_emailtxt, mail_icon),
              SizedBox(height: 20),

              Container(
                height: 60,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: color.border_grey_color),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Container(
                      child: CountryPickerDropdown(
                        icon: Image.asset(
                          vertical,
                          height: size.height * 0.055,
                        ),
                        initialValue: 'in',
                        itemBuilder: _buildDropdownItem,
                        onValuePicked: (Country country) {
                          print("${country.name}");
                        },
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: size.width * 0.55,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Phone Number",
                              hintStyle: TextStyles.withColor(
                                  TextStyles.mn14, color.textgrey_color)),
                          onChanged: (value) {
                            // this.phoneNo=value;
                            print(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButtons(
                name: update,
                onTap: () {},
              )
              // SizedBox(
              //   width: size.width,
              //   child: Elevatedbuttons().elevatedbutton(update, null, context),
              // )
            ],
          ),
        ),
      ),
    );
  }

  textbox(contrl, hint, img) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 10),
        height: 60,
        decoration: BoxDecoration(
            border: Border.all(color: color.border_grey_color),
            borderRadius: BorderRadius.circular(15)),
        width: size.width,
        child: TextField(
          keyboardType: TextInputType.number,
          controller: contrl,
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  img,
                ),
              ),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 30, maxWidth: 30),
              border: InputBorder.none,
              hintText: hint,
              hintStyle:
                  TextStyles.withColor(TextStyles.mn14, color.textgrey_color)),
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            Container(
                width: 80,
                child: Row(
                  children: [
                    CountryPickerUtils.getDefaultFlagImage(country),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      width: 40,
                      child: Text(
                        "+${country.phoneCode}",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )),
            Icon(Icons.keyboard_arrow_down_sharp)
          ],
        ),
      );
}
