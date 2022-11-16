import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyreshifter/getx/provider.dart';

import '../Api/Api.dart';
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
  DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  String countrycode = "+91";
  int accounttype = 1;
  int roleid = 3;
  List Hmscard_img = [];
  String? errormsg;

  @override
  void onInit() {
    super.onInit();
  }

  // var formData = FormData.fromMap({});
  registe_user(context) async {
    var local_formdata = {
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
      "companyName": Company_name.text,
      "companyNumber": company_number.text,
      "email": email.text,
      "countryCode": countrycode,
      "mobileNumber": phone_no.text,
      "birthdate": birthday.text,
      "password": password.text,
      "confirmPassword": confirm_password.text,
      "aboutUs": aboutUs.text,
      "file1": Hmscard_img,
      "accountType": accounttype,
      "roleId": roleid
    };

    dio.FormData formData = dio.FormData.fromMap(local_formdata);

    Api().apicall_post(Urls().userregister, formData, context).then((value) {
      print(value);
      errormsg = value["message"];
    });
  }
}
