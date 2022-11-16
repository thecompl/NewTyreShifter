import 'dart:convert';

import 'package:get/get.dart';
import 'package:tyreshifter/Models/Cartype.dart';
import '../Api/Api.dart';
import '../config/Urls/Urls.dart';

class Cartypecontroller extends GetxController {
  List carlist = [];
  Cartype? cartypemodel;

  getcartype(context) {
    Api().apicall_get(
      Urls().cartype,
      {},
    ).then((value) {
      carlist = value;

      // cartypemodel = Cartype.fromJson(value);
    });
  }
}
