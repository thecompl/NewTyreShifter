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
  bool showloading = false;
  String? accesstoken;
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  login_user(context) async {
    showloading == true;
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
      if (value.isNotEmpty) {
        print("messge" + value['message'].toString());

        if (value['message'] == null) {
          accesstoken = value['accessToken'];

          box.write("accesstoken", accesstoken);

          nextScreen(context, Enable_location());

          showloading = false;
        } else {
          Get.snackbar(value['message'].toString(), "");
        }

        print("data of login =>" + value.toString());
      } else {
        print("login failed");
      }
    });
  }
}
