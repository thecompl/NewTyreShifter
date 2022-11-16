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

class LogoutCtrl extends GetxController {
  bool showloading = false;
  String? accesstoken;
  String? msg = " ";
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  logout(context) {
    showloading == true;
    Api().apicall_get(Urls().userlogout, {}).then((value) {
      print(value);
      if (value.isNotEmpty) {
        box.write("logoutmsg", value['message']);
      } else {
        print("Value failed");
      }
    });
  }
}
