import 'dart:convert';

import 'package:get/get.dart';
import 'package:tyreshifter/Models/Cartype.dart';
import '../Api/Api.dart';
import '../config/Urls/Urls.dart';

class Getweekday extends GetxController {
  List weekday = [];

  getweekday(context) {
    Api().apicall_get(
      Urls().getweekday,
      {},
    ).then((value) {
      weekday = value;
      print(weekday);
    });
  }
}
