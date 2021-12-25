

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class C extends GetxController {
  DateTime _selectedDate = DateTime.now();
  void onInit() async {
    getDateFromUser();
    super.onInit();
  }

   void getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: ,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );
    if (_pickerDate != null) {
      (() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    } else {
      print("it's null or somthing is wrong");
    }
  }
}
