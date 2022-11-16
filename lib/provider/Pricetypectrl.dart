import 'package:get/get.dart';

import '../Api/Api.dart';
import '../config/Urls/Urls.dart';

class Pricetypectrl extends GetxController {
  pricetype(context) {
    Api().apicall_get(
      Urls().pricetypes,
      {},
    ).then((value) {
      print(value);
    });
  }
}
