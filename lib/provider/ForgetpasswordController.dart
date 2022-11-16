import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Api/Api.dart';
import '../config/Urls/Urls.dart';

class ForgetpasswordController extends GetxController {
  TextEditingController email = TextEditingController();
 
  @override
  void onInit() {
    super.onInit();
  }

  forget_password(context) {
    try{
Api().apicall_post(
            Urls().forgetpassword,
           {
  "email": email.text
},
            context)
        .then((value) {
      if (value.isNotEmpty) {
        print("msg sent");
        print("data of login =>" + value.toString());
      } else {
        print("msg not sent");
      }
    });
    }catch(e){
      print(e);
    }
    
  }
}
