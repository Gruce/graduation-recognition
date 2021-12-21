import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/schedule/lecture.dart';
import 'package:graduaiton_app/screens/general/luctures/lucture_search_widget.dart';
import 'package:graduaiton_app/util/utilities.dart';

class Property {
  String name;
  bool value;
  Icon icon;
  Widget widget;
  Property(
      {required this.name,
      required this.value,
      required this.icon,
      required this.widget});
}

class LucturesController extends GetxController {
  List<LectureModel> lectures = <LectureModel>[];
  List<LectureModel> filteredLectures = <LectureModel>[];
  List<Property> properties = <Property>[].obs;

  @override
  void onInit() {
    properties.addAll([
      Property(
        name: 'search',
        value: false,
        icon: const Icon(Icons.search),
        widget: LuctureSearchWidget(),
      ),
      Property(
        name: 'stage',
        value: false,
        icon: const Icon(Icons.storage),
        widget: LuctureSearchWidget(),
      ),
      Property(
        name: 'unit',
        value: false,
        icon: const Icon(Icons.ac_unit),
        widget: LuctureSearchWidget(),
      ),
      Property(
        name: 'day',
        value: false,
        icon: const Icon(Icons.date_range),
        widget: LuctureSearchWidget(),
      ),
    ]);

    filteredLectures.assignAll(lectures);
    super.onInit();
  }

  void toggleProperty(Property p) {
    int i = properties.indexOf(p);
    properties[i].value = !properties[i].value;
    update();
  }
}
