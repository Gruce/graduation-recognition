import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/section.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../config.dart';

class AdminSectionsController extends GetxController {
  late SharedPreferences prefs;
  RxList sections = <SectionModel>[].obs;
  RxInt sectionSelectedIndex = 0.obs;

  // List sections = ['Section', 'CS', 'IT'];


  final api = Config.api;

  @override
  void onInit() async {
    fetchSections();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchSections() async {
    var res = await Utilities.httpGet('sections');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        sections.add(SectionModel.fromJson(element));
      }
    }
    update();
  }

  void section(text) {
    if (text.isEmpty) {
      sections.assignAll(sections);
    } else {
      sections.assignAll(sections
          .where((section) =>
              section.name.toLowerCase().contains(text.toLowerCase()))
          .toList());
    }
    update();
  }
}

