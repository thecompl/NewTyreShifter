import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import '../Api/Api.dart';
import '../Common/Enable_location.dart';
import '../config/Urls/Urls.dart';

class Changepassword_Ctrl extends GetxController {
  TextEditingController old_password = TextEditingController();
  TextEditingController new_password = TextEditingController();
  TextEditingController confirm_new_password = TextEditingController();

  bool showloading = false;
  String? accesstoken;
  String? msg = " ";
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  Change_password(context) async {
    showloading == true;
    Api()
        .apicall_post(
            Urls().changepassword,
            {
              "password": old_password.text,
              "newPassword": new_password.text,
              "confirmPassword": confirm_new_password.text
            },
            context)
        .then((value) {
      print(value);
      if (value.isNotEmpty) {
        msg = value['message'];
      } else {
        print("Value failed");
      }
    });
  }
}
