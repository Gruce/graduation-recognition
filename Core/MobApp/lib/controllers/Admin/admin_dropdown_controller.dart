
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
     String? selectedValue;
     String? newValue;
    var language = <String>['English', 'Espanol'];

    void onSelected(String value) {
    selectedValue = value;

    update();

    print(selectedValue);
    changeLanguage(selectedValue);
  }

  changeLanguage(String? selectedLanguage) {
     switch (selectedLanguage) {
     case 'English':
       Get.updateLocale(const Locale('en_US'));
       print('Changed to En');
       break;
     case 'Espanol':
       Get.updateLocale(const Locale('en_US'));
       print('Changed to Es');
       break;
     default:
       Get.updateLocale(const Locale('en_US'));
       print('Fallback to En');
       break;
    }
  }
}