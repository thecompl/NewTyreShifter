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

class Save_avalability extends GetxController {
  bool showloading = false;
  String? accesstoken;
  String? msg = " ";
  int totalworker = 0;
  final box = GetStorage();
  List savelist = [];
  List weekdayid = [];
  List start_time = [];
  List endtime = [];
  List is_available = [];
  @override
  void onInit() {
    super.onInit();
  }

  save_avalability(context) {
    showloading == true;
    Api()
        .apicall_post(
            Urls().save_avalability,
            {
              "totalWorker": totalworker,
              "availability": [
                for (var i = 0; i <= savelist.length; i++)
                  {
                    "weekdayId": weekdayid,
                    "startTime": start_time,
                    "endTime": endtime,
                    "isAvailable": is_available
                  },
              ]
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
