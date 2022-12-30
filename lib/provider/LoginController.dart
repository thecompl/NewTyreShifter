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

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  int roleid = 0;
  DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  var showloading = false.obs;
  String? accesstoken;
  final box = GetStorage();

  login_user(context) async {
    showloading.value == true;
    Api()
        .apicall_post(
            Urls().userlogin,
            {
              "deviceToken": Platform.isIOS
                  ? (await _deviceInfo.iosInfo).identifierForVendor
                  : (await _deviceInfo.androidInfo).id,
              "deviceType": Platform.isIOS ? "Ios" : "Android",
              "deviceName": Platform.isIOS
                  ? (await _deviceInfo.iosInfo).name ?? ""
                  : (await _deviceInfo.androidInfo).host ?? "",
              "deviceVersion": Platform.isIOS
                  ? (await _deviceInfo.iosInfo).systemVersion ?? ""
                  : (await _deviceInfo.androidInfo).version.baseOS,
              "appVersion": "string",
              "username": username.text,
              "password": password.text,
              "roleId": roleid
            },
            context)
        .then((value) {
      if (value.statusCode == 200) {
        print("messge" + value.data.toString());

        box.write("accesstoken", value.data['accessToken']);
        nextScreen(context, Enable_location());
      } else {
        Get.snackbar(value.data['message'], "");
      }
    });
    showloading.value = false;
  }
}
