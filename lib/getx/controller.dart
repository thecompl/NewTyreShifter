import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyreshifter/Getstorage/getstorage.dart';
import 'package:tyreshifter/getx/provider.dart';

import '../Api/Api.dart';
import '../Common/Otp.dart';
import '../config/Navagate_Next.dart';
import '../config/Urls/Urls.dart';

class DataController extends GetxController {
  TextEditingController Company_name = TextEditingController();
  TextEditingController company_number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone_no = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  TextEditingController aboutUs = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  String countrycode = "+91";
  int accounttype = 1;
  int roleid = 1;
  String? errormsg;

  registe_user(context) async {
    var local_formdata = {
      "deviceToken": Platform.isIOS
          ? (await _deviceInfo.iosInfo).identifierForVendor
          : (await _deviceInfo.androidInfo).id,
      "deviceType": Platform.isIOS ? "Ios" : "Android",
      "deviceName": Platform.isIOS
          ? (await _deviceInfo.iosInfo).name ?? ""
          : (await _deviceInfo.androidInfo).host ?? "",
      "deviceVersion": "1.0",
      "AppVersion": "1.0.0",
      "companyName": Company_name.text,
      "firstName": "shinu",
      "lastName": "shinu",
      "companyNumber": company_number.text,
      "email": email.text,
      "countryCode": countrycode,
      "mobileNumber": phone_no.text,
      "birthdate": 24,
      "password": password.text,
      "confirmPassword": confirm_password.text,
      "aboutUs": aboutUs.text,
      "accountType": accounttype,
      "roleId": roleid
    };

    dio.FormData formData = dio.FormData.fromMap(local_formdata);

    Api().apicall_post(Urls().userregister, formData, context).then((value) {
      if (value.statusCode == 200) {
        box.write("accesstoken", value.data['accessToken']);
        nextScreen(context, Otp());
      } else {
        Get.snackbar(value.data['message'], "");
      }
    });
  }
}
