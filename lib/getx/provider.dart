import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyreshifter/Api/Api.dart';

import '../config/string.dart';

class Provider extends GetConnect {
  TextEditingController Company_name = TextEditingController();
  TextEditingController company_number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController controllerDestino = TextEditingController();
  TextEditingController phone_no = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  TextEditingController aboutUs = TextEditingController();
  int countrycode = 91;
  int accounttype = 1;
  int roleid = 3;
  String Hmscard_img = "";

  Future<dynamic> getUser(context, local_formdata) async {
    //  Map<String, dynamic> requestBody = <String, dynamic>{
    //     "companyName": Company_name.text,
    //     "companyNumber": company_number.text,
    //     "email": email.text,
    //     "countryCode": countrycode,
    //     "mobileNumber": phone_no.text,
    //     "birthdate": birthday.text,
    //     "password": password.text,
    //     "confirmPassword": confirm_password.text,
    //     "aboutUs": aboutUs.text,
    //     "file1": Hmscard_img,
    //     "accountType": accounttype,
    //     "roleId": roleid
    //   };
    // print(local_formdata);

    // Api().apicall_post("account/register", formData, context).then((value) {
    //   print(value.toString());
    // });
  }
}
