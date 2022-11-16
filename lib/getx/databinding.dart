import 'package:get/get.dart';
import 'package:tyreshifter/provider/ForgetpasswordController.dart';
import 'package:tyreshifter/provider/LoginController.dart';

import '../provider/Getweekday.dart';
import '../provider/cartypecontroller.dart';
import 'controller.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ForgetpasswordController());
    Get.lazyPut(() => Cartypecontroller());
    Get.lazyPut(() => Getweekday());
  }
}
