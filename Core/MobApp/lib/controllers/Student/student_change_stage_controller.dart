import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/util/utilities.dart';

class ChangeStageController extends GetxController{


  late TextEditingController codeController;
  @override
  void onInit() async {
    codeController = TextEditingController();
  
    super.onInit();
  }

  void changeUnit() async {
    var res = await Utilities.httpPost('student/change-unit/', {
      'code': codeController.text
    });
   
    if (res.statusCode == 200) {
 Get.snackbar('Successful', 'Done',
        backgroundColor: Colors.green[200], icon: Icon(Icons.done));
    }else{
      Get.snackbar('Erroe', "Your code does not working",
        backgroundColor: Colors.red[200], icon: Icon(Icons.close));
    }
    update();
  }
}